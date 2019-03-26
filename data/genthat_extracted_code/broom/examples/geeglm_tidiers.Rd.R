library(broom)


### Name: tidy.geeglm
### Title: Tidy a(n) geeglm object
### Aliases: tidy.geeglm geeglm_tidiers geepack_tidiers

### ** Examples


if (requireNamespace("geepack", quietly = TRUE)) {
  library(geepack)
  data(state)
    
  ds <- data.frame(state.region, state.x77)

  geefit <- geeglm(Income ~ Frost + Murder, id = state.region,
                   data = ds, family = gaussian,
                   corstr = "exchangeable")

  tidy(geefit)
  tidy(geefit, quick = TRUE)
  tidy(geefit, conf.int = TRUE)
}




