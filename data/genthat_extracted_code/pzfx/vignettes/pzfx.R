## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ------------------------------------------------------------------------
library(pzfx)
pzfx_tables(system.file("extdata/exponential_decay.pzfx", package="pzfx"))

## ------------------------------------------------------------------------
df <- read_pzfx(system.file("extdata/exponential_decay.pzfx", package="pzfx"), table="Exponential decay")
head(df)

## ------------------------------------------------------------------------
df <- read_pzfx(system.file("extdata/exponential_decay.pzfx", package="pzfx"), table=1)
head(df)

## ------------------------------------------------------------------------
tmp <- tempfile(fileext=".pzfx")
write_pzfx(df, tmp, row_names=FALSE, x_col="Minutes")
out_df <- read_pzfx(tmp, table=1)
head(out_df)
unlink(tmp)

