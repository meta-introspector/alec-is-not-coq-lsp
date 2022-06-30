(************************************************************************)
(*         *   The Coq Proof Assistant / The Coq Development Team       *)
(*  v      *   INRIA, CNRS and contributors - Copyright 1999-2018       *)
(* <O___,, *       (see CREDITS file for the list of authors)           *)
(*   \VV/  **************************************************************)
(*    //   *    This file is distributed under the terms of the         *)
(*         *     GNU Lesser General Public License Version 2.1          *)
(*         *     (see LICENSE file for the text of the license)         *)
(************************************************************************)

(************************************************************************)
(* Coq Language Server Protocol / SerAPI                                *)
(* Copyright 2016-2019 MINES ParisTech -- Dual License LGPL 2.1 / GPL3+ *)
(* Written by: Emilio J. Gallego Arias                                  *)
(************************************************************************)

(**************************************************************************)
(* Low-level, internal Coq initialization                                 *)
(**************************************************************************)

type coq_opts =
  { fb_handler : Feedback.feedback -> unit
        (** callback to handle async feedback *)
  ; ml_load : (string -> unit) option  (** callback to load cma/cmo files *)
  ; debug : bool  (** Enable Coq Debug mode *)
  }

val coq_init : coq_opts -> Vernacstate.t

val doc_init :
     root_state:Vernacstate.t
  -> vo_load_path:Loadpath.vo_path list
  -> ml_include_path:string list
  -> libname:Names.DirPath.t
  -> require_libs:
       (string * string option * Vernacexpr.export_with_cats option) list
  -> Vernacstate.t
