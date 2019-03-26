## ----read.csv, echo=TRUE-------------------------------------------------
library(ABC.RAP)
data("test_data")
data("nonspecific_probes")
data("annotation_file")

## ----filter, echo=TRUE---------------------------------------------------
test_data_filtered <- filter_data(test_data)

## ----annotation, echo=TRUE-----------------------------------------------
test_data_annotated <- annotate_data(test_data_filtered)

## ----plot_data, echo=TRUE, fig.height= 7, fig.width= 10------------------
plot_data(test_data_filtered, 1, 2, 3, 4)

## ----t.test, echo=TRUE---------------------------------------------------
test_data_ttest <- ttest_data(test_data_filtered, 1, 2, 3, 4, 1e-3)

## ----nrow2, echo=TRUE----------------------------------------------------
nrow(test_data_ttest)

## ----delta_beta, echo=TRUE-----------------------------------------------
test_delta_beta <- delta_beta_data(test_data_filtered, 1, 2, 3, 4, 0.5, -0.5, 0.94, 0.06)

## ----nrow3, echo=TRUE----------------------------------------------------
nrow(test_delta_beta)

## ----overlap, echo=TRUE--------------------------------------------------
test_overlapped_data <- overlap_data(test_data_ttest, test_delta_beta)

## ----nrow, echo=TRUE-----------------------------------------------------
nrow(test_overlapped_data)

## ----CpG_hits, echo=TRUE-------------------------------------------------
test_CpG_hits <- CpG_hits(test_overlapped_data)

## ----CpG_hits2, echo=TRUE------------------------------------------------
test_CpG_hits

## ----plot, echo=TRUE, fig.height=5, fig.width=7--------------------------
plot_candidate_genes(test_overlapped_data)

## ----investigate, echo=TRUE, fig.height=7, fig.width=10------------------
KLHL34 <- plot_gene(test_data_annotated, "KLHL34", 1, 2, 3, 4)

## ----process, echo=TRUE--------------------------------------------------
process.ABC.RAP(test_data, 1, 2, 3, 4, 1e-3, 0.5, -0.5, 0.94, 0.06)

