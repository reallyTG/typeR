library(ggstatsplot)


### Name: subtitle_meta_ggcoefstats
### Title: Prepare subtitle with meta-analysis results
### Aliases: subtitle_meta_ggcoefstats

### ** Examples

# let's create a dataframe
df_results <-
  structure(
    .Data = list(estimate = c(
      0.382047603321706, 0.780783111514665,
      0.425607573765058, 0.558365541235078, 0.956473848429961
    ), std.error = c(
      0.0465576338644502,
      0.0330218199731529, 0.0362834986178494, 0.0480571500648261, 0.062215818388157
    ), t.value = c(
      8.20590677855356, 23.6444603038067, 11.7300588415607,
      11.6187818146078, 15.3734833553524
    ), conf.low = c(
      0.290515146096969,
      0.715841986960399, 0.354354575031406, 0.46379116008131, 0.827446138277154
    ), conf.high = c(
      0.473580060546444, 0.845724236068931, 0.496860572498711,
      0.652939922388847, 1.08550155858277
    ), p.value.x = c(
      3.28679518728519e-15,
      4.04778497135963e-75, 7.59757330804449e-29, 5.45155840151592e-26,
      2.99171217913312e-13
    ), df.residual = c(
      394L, 358L, 622L, 298L,
      22L
    )),
    row.names = c(NA, -5L),
    class = c("tbl_df", "tbl", "data.frame")
  )

# making subtitle
ggstatsplot::subtitle_meta_ggcoefstats(
  data = df_results,
  k = 3,
  messages = FALSE
)

# getting tidy data frame with coefficients
ggstatsplot::subtitle_meta_ggcoefstats(
  data = df_results,
  messages = FALSE,
  output = "tidy"
)

# making caption
ggstatsplot::subtitle_meta_ggcoefstats(
  data = df_results,
  k = 2,
  messages = FALSE,
  output = "caption"
)

# getting dataframe with model summary
ggstatsplot::subtitle_meta_ggcoefstats(
  data = df_results,
  messages = FALSE,
  output = "glance"
)



