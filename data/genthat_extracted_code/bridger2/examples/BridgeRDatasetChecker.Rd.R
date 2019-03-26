library(bridger2)


### Name: BridgeRDatasetChecker
### Title: BRIC-seq Dataset checker
### Aliases: BridgeRDatasetChecker

### ** Examples

library(data.table)
normalized_table <- data.table(gr_id = c(8, 9, 14),
                               symbol = c("AAAS", "AACS", "AADAT"),
                               accession_id = c("NM_015665", "NM_023928", "NM_182662"),
                               locus = c("chr12", "chr12", "chr4"),
                               CTRL_1_0h = c(1.00, 1.00, 1.00),
                               CTRL_1_1h = c(1.00, 0.86, 0.96),
                               CTRL_1_2h = c(1.00, 0.96, 0.88),
                               CTRL_1_4h = c(1.00, 0.74, 0.85),
                               CTRL_1_8h = c(1.00, 0.86, 0.68),
                               CTRL_1_12h = c(1.01, 0.65, 0.60),
                               gr_id = c(8, 9, 14),
                               symbol = c("AAAS", "AACS", "AADAT"),
                               accession_id = c("NM_015665", "NM_023928", "NM_182662"),
                               locus = c("chr12", "chr12", "chr4"),
                               KD_1_0h = c(1.00, 1.00, 1.00),
                               KD_1_1h = c(1.01, 0.73, 0.71),
                               KD_1_2h = c(1.01, 0.77, 0.69),
                               KD_1_4h = c(1.01, 0.72, 0.67),
                               KD_1_8h = c(1.01, 0.64, 0.38),
                               KD_1_12h = c(1.00, 0.89, 0.63))
group <- c("Control", "Knockdown")
hour <- c(0, 1, 2, 4, 8, 12)
fig_list_norm <- BridgeRDatasetChecker(inputFile = normalized_table,
                                       save = FALSE)




