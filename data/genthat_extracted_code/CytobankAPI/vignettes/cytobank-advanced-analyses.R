## ---- echo=FALSE, message=FALSE------------------------------------------
library(CytobankAPI)
knitr::opts_chunk$set(comment = "#>", collapse = TRUE)

SPADE_object <- new("SPADE")
viSNE_object <- new("viSNE")
CITRUS_object <- new("CITRUS")
FlowSOM_object <- new("FlowSOM")

## ------------------------------------------------------------------------
slotNames(CITRUS_object)

## ------------------------------------------------------------------------
slotNames(FlowSOM_object)

## ------------------------------------------------------------------------
slotNames(SPADE_object)

## ------------------------------------------------------------------------
slotNames(viSNE_object)

## ---- echo=FALSE, message=FALSE------------------------------------------
fold_change_groups <- data.frame(id=c(44853, 44854, 44855, 44856, 44857, 44858, 44859, 44860, 44861),
                                 name=c("file1.fcs", "file2.fcs", "file3.fcs", "file4.fcs", "file5.fcs", "file6.fcs", "file7.fcs", "file8.fcs", "file9.fcs"),
                                 group_name=c("Group 1", "Group 1", "Group 1", "Group 1", "Group 2", "Group 2", "Group 2", "Group 2", "Unassigned"),
                                 stringsAsFactors=FALSE)

knitr::kable(fold_change_groups)

## ---- echo=FALSE, message=FALSE------------------------------------------
fold_change_groups <- data.frame(id=c(44853, 44854, 44855, 44856, 44857, 44858, 44859, 44860),
                                 name=c("file1.fcs", "file2.fcs", "file3.fcs", "file4.fcs", "file5.fcs", "file6.fcs", "file7.fcs", "file8.fcs"),
                                 baseline=c(FALSE, TRUE, FALSE, FALSE, FALSE, TRUE, TRUE, FALSE),
                                 group_name=c("Group 1", "Group 2", "Group 1", "Group 2", "Group 1", "Group 1", "Group 1", "Group 2"),
                                 stringsAsFactors=FALSE)

knitr::kable(fold_change_groups)

## ---- echo=FALSE, message=FALSE------------------------------------------
fold_change_groups <- data.frame(id=c(44853, 44856, 44857, 44858, 44854, 44855, 44853, 44856),
                                 name=c("file1.fcs", "file4.fcs", "file5.fcs", "file6.fcs", "file2.fcs", "file3.fcs", "file1.fcs", "file4.fcs"),
                                 samplingCount=c(NA_integer_, NA_integer_, NA_integer_, NA_integer_, NA_integer_, NA_integer_, NA_integer_, NA_integer_),
                                 eventCount=c(NA_integer_, NA_integer_, NA_integer_, NA_integer_, NA_integer_, NA_integer_, NA_integer_, NA_integer_),
                                 populationId=c(1, 4, 4, 4, 2, 2, 2, 2),
                                 populationName=c("Population 1", "Population 4", "Population 4", "Population 4", "Population 2", "Population 2", "Population 2", "Population 2"),
                                 stringsAsFactors=FALSE)

knitr::kable(fold_change_groups)

