library(ggstatsplot)


### Name: ggcoefstats_label_maker
### Title: Create labels with statistical details for 'ggcoefstats'.
### Aliases: ggcoefstats_label_maker
### Keywords: internal

### ** Examples

## Not run: 
##D # show all columns in a tibble
##D options(tibble.width = Inf)
##D 
##D # for reproducibility
##D set.seed(123)
##D 
##D #------------------------- models with *t*-statistic ------------------
##D # model with t-statistic
##D ggstatsplot:::ggcoefstats_label_maker(x = broomExtra::tidy(stats::lm(
##D   data = mtcars, formula = wt ~ cyl * mpg
##D )), statistic = "t")
##D 
##D # (in case `x` is not a dataframe, no need to specify `statistic` argument;
##D # this will be figured out by the function itself)
##D 
##D #------------------------- models with *t*-statistic ------------------
##D 
##D # dataframe
##D clotting <- data.frame(
##D   u = c(5, 10, 15, 20, 30, 40, 60, 80, 100),
##D   lot1 = c(118, 58, 42, 35, 27, 25, 21, 19, 18),
##D   lot2 = c(69, 35, 26, 21, 18, 16, 13, 12, 12)
##D )
##D 
##D # model
##D mod <-
##D   stats::glm(
##D     formula = lot1 ~ log(u),
##D     data = clotting,
##D     family = Gamma
##D   )
##D 
##D # model with t-statistic
##D ggstatsplot:::ggcoefstats_label_maker(
##D   x = mod,
##D   tidy_df = broomExtra::tidy(
##D     x = mod,
##D     conf.int = TRUE,
##D     conf.level = 0.95
##D   )
##D )
##D 
##D #------------------------- models with *z*-statistic --------------------
##D 
##D # preparing dataframe
##D counts <- c(18, 17, 15, 20, 10, 20, 25, 13, 12)
##D outcome <- gl(3, 1, 9)
##D treatment <- gl(3, 3)
##D d.AD <- data.frame(treatment, outcome, counts)
##D 
##D # model
##D mod <- stats::glm(
##D   formula = counts ~ outcome + treatment,
##D   family = poisson(),
##D   data = d.AD
##D )
##D 
##D # creating tidy dataframe with label column
##D ggstatsplot:::ggcoefstats_label_maker(x = mod, tidy_df = broomExtra::tidy(mod))
##D 
##D #------------------------- models with *f*-statistic --------------------
##D # creating a model object
##D op <- options(contrasts = c("contr.helmert", "contr.poly"))
##D npk.aov <- stats::aov(formula = yield ~ block + N * P * K, data = npk)
##D 
##D # converting to a dataframe using
##D tidy_df <- ggstatsplot::lm_effsize_ci(
##D   object = npk.aov,
##D   effsize = "omega",
##D   partial = FALSE,
##D   nboot = 50
##D ) %>%
##D   dplyr::rename(.data = ., estimate = omegasq, statistic = F.value)
##D 
##D # including a new column with a label
##D ggstatsplot:::ggcoefstats_label_maker(
##D   x = npk.aov,
##D   tidy_df = tidy_df,
##D   effsize = "omega",
##D   partial = FALSE
##D )
## End(Not run)




