library(flextable)


### Name: xtable_to_flextable
### Title: get a flextable from a xtable object
### Aliases: xtable_to_flextable

### ** Examples

library(officer)
if( require("xtable") ){

  data(tli)
  tli.table <- xtable(tli[1:10, ])
  align(tli.table) <- rep("r", 6)
  align(tli.table) <- "|r|r|clr|r|"
  ft <- xtable_to_flextable(
    tli.table,
    rotate.colnames = TRUE,
    include.rownames = FALSE)
  ft <- height(ft, i = 1, part = "header", height = 1)
  ft

  ## No test: 
  Grade3 <- c("A","B","B","A","B","C","C","D","A","B",
    "C","C","C","D","B","B","D","C","C","D")
  Grade6 <- c("A","A","A","B","B","B","B","B","C","C",
    "A","C","C","C","D","D","D","D","D","D")
  Cohort <- table(Grade3, Grade6)
  ft <- xtable_to_flextable(xtable(Cohort))
  ft <- set_header_labels(ft, rowname = "Grade 3")
  ft <- autofit(ft)
  ft <- add_header(ft, A = "Grade 6")
  ft <- merge_at(ft, i = 1, j = seq_len( ncol(Cohort) ) + 1,
    part = "header" )
  ft <- bold(ft, j = 1, bold = TRUE, part = "body")
  ft <- height_all(ft, part = "header", height = .4)
  ft

  temp.ts <- ts(cumsum(1 + round(rnorm(100), 0)),
    start = c(1954, 7), frequency = 12)
  xtable_to_flextable(x = xtable(temp.ts, digits = 0),
    NA.string = "-")
  
## End(No test)
}



