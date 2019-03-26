library(pccc)


### Name: ccc
### Title: Complex Chronic Conditions (CCC)
### Aliases: ccc

### ** Examples

eg_data <-
  dplyr::data_frame(id = letters,
                    dx1 = c(NA, NA, sample(get_codes(10)[["hemato_immu", "dx"]], 24)),
                    dx2 = c("A", sample(get_codes(10)[["gi", "dx"]], 25)),
                    dx3 = LETTERS,
                    pc1 = c("B", sample(get_codes(10)[["cvd", "pc"]], 25)),
                    pc2 = LETTERS,
                    other_col = LETTERS)

ccc(eg_data, 
    id,
    dx_cols = dplyr::starts_with("dx"),
    pc_cols = dplyr::starts_with("pc"),
    icdv = 10)




