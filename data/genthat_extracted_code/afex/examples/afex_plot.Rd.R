library(afex)


### Name: afex_plot
### Title: m-way Plot with Error Bars and Raw Data
### Aliases: afex_plot afex_plot.afex_aov afex_plot.mixed afex_plot.merMod
###   interaction_plot oneway_plot

### ** Examples

# note: use library("ggplot") to avoid "ggplot2::" in the following

##################################################################
##                2-factor Within-Subject Design                ##
##################################################################

data(md_12.1)
aw <- aov_ez("id", "rt", md_12.1, within = c("angle", "noise"))

##---------------------------------------------------------------
##                    Basic Interaction Plots                   -
##---------------------------------------------------------------

afex_plot(aw, x = "angle", trace = "noise") 
# or: afex_plot(aw, x = ~angle, trace = ~noise)

afex_plot(aw, x = "noise", trace = "angle")

### For within-subject designs, using within-subject CIs is better:
afex_plot(aw, x = "angle", trace = "noise", error = "within") 
(p1 <- afex_plot(aw, x = "noise", trace = "angle", error = "within"))

## use different themes for nicer graphs:
p1 + ggplot2::theme_bw()
## Not run: 
##D p1 + ggplot2::theme_light()
##D p1 + ggplot2::theme_minimal()
##D p1 + jtools::theme_apa()
##D p1 + ggpubr::theme_pubr()
##D 
##D ### set theme globally for R session:
##D ggplot2::theme_set(ggplot2::theme_bw())
##D 
##D ### There are several ways to deal with overlapping points in the background besides alpha
##D # 1. using the default data geom and ggplot2::position_jitterdodge
##D afex_plot(aw, x = "noise", trace = "angle", error = "within", dodge = 0.3,
##D           data_arg = list(
##D             position = 
##D               ggplot2::position_jitterdodge(
##D                 jitter.width = 0, 
##D                 jitter.height = 5, 
##D                 dodge.width = 0.3  ## needs to be same as dodge
##D                 ),
##D             color = "darkgrey"))
##D 
##D # 2. using ggbeeswarm::geom_beeswarm
##D afex_plot(aw, x = "noise", trace = "angle", error = "within", dodge = 0.5,
##D           data_geom = ggbeeswarm::geom_beeswarm,
##D           data_arg = list(
##D             dodge.width = 0.5,  ## needs to be same as dodge
##D             cex = 0.8,
##D             color = "darkgrey"))
##D 
##D # 3. do not display points, but use a violinplot: ggplot2::geom_violin
##D afex_plot(aw, x = "noise", trace = "angle", error = "within", 
##D           data_geom = ggplot2::geom_violin, 
##D           data_arg = list(width = 0.5))
##D 
##D # 4. violinplots with color: ggplot2::geom_violin
##D afex_plot(aw, x = "noise", trace = "angle", error = "within", 
##D           mapping = c("linetype", "shape", "fill"),
##D           data_geom = ggplot2::geom_violin, 
##D           data_arg = list(width = 0.5))
##D 
##D # 5. do not display points, but use a boxplot: ggplot2::geom_boxplot
##D afex_plot(aw, x = "noise", trace = "angle", error = "within", 
##D           data_geom = ggplot2::geom_boxplot, 
##D           data_arg = list(width = 0.3))
##D           
##D # 6. combine points with boxplot: ggpol::geom_boxjitter
##D afex_plot(aw, x = "noise", trace = "angle", error = "within", 
##D           data_geom = ggpol::geom_boxjitter, 
##D           data_arg = list(width = 0.3))
##D ## hides error bars!
##D 
##D # 7. nicer variant of ggpol::geom_boxjitter
##D afex_plot(aw, x = "noise", trace = "angle", error = "within", 
##D           mapping = c("shape", "fill"),
##D           data_geom = ggpol::geom_boxjitter, 
##D           data_arg = list(
##D             width = 0.3, 
##D             jitter.width = 0,
##D             jitter.height = 10,
##D             outlier.intersect = TRUE),
##D           point_arg = list(size = 2.5), 
##D           error_arg = list(size = 1.5, width = 0))
##D 
##D # 8. nicer variant of ggpol::geom_boxjitter without lines
##D afex_plot(aw, x = "noise", trace = "angle", error = "within", dodge = 0.7,
##D           mapping = c("shape", "fill"),
##D           data_geom = ggpol::geom_boxjitter, 
##D           data_arg = list(
##D             width = 0.5, 
##D             jitter.width = 0,
##D             jitter.height = 10,
##D             outlier.intersect = TRUE),
##D           point_arg = list(size = 2.5), 
##D           line_arg = list(linetype = 0),
##D           error_arg = list(size = 1.5, width = 0))
## End(Not run)


##---------------------------------------------------------------
##                      Basic One-Way Plots                     -
##---------------------------------------------------------------

afex_plot(aw, x = "angle", error = "within") ## default

## Not run: 
##D ## with color we need larger points
##D afex_plot(aw, x = "angle", mapping = "color", error = "within", 
##D           point_arg = list(size = 2.5), 
##D           error_arg = list(size = 1.5, width = 0.05)) 
##D 
##D library("ggpol") ## currently required for combination of boxplot and points
##D afex_plot(aw, x = "angle", error = "within", data_geom = ggpol::geom_boxjitter)
##D 
##D ## nicer
##D afex_plot(aw, x = "angle", error = "within", data_geom = ggpol::geom_boxjitter, 
##D           mapping = "fill", data_alpha = 0.7, 
##D           data_arg = list(
##D             width = 0.6, 
##D             jitter.width = 0.07,
##D             jitter.height = 10,
##D             outlier.intersect = TRUE
##D           ),
##D           point_arg = list(size = 2.5), 
##D           error_arg = list(size = 1.5, width = 0.05))
##D 
##D ##---------------------------------------------------------------
##D ##                      Other Basic Options                     -
##D ##---------------------------------------------------------------
##D 
##D ## relabel factor levels via new_levels
##D afex_plot(aw, x = "noise", trace = "angle", 
##D           new_levels = list(angle = c("0", "4", "8"),
##D                             noise = c("Absent", "Present")))
##D 
##D ## Change title of legend
##D afex_plot(aw, x = "noise", trace = "angle", 
##D           legend_title = "Noise Condition")
##D 
##D ## for plots with few factor levels, smaller dodge might be better:
##D afex_plot(aw, x = "angle", trace = "noise", dodge = 0.25) 
##D 
##D #################################################################
##D ##                    4-factor Mixed Design                    ##
##D #################################################################
##D 
##D data(obk.long, package = "afex")
##D a1 <- aov_car(value ~ treatment * gender + Error(id/(phase*hour)), 
##D               data = obk.long, observed = "gender")
##D 
##D ## too difficult to see anything
##D afex_plot(a1, ~phase*hour, ~treatment) +
##D   ggplot2::theme_light()
##D 
##D ## better
##D afex_plot(a1, ~hour, ~treatment, ~phase) +
##D   ggplot2::theme_light()
##D 
##D ## even better and different model-based standard errors
##D afex_plot(a1, ~hour, ~treatment, ~phase, 
##D           dodge = 0.65, 
##D           data_arg = list(
##D             position = 
##D               ggplot2::position_jitterdodge(
##D                 jitter.width = 0, 
##D                 jitter.height = 0.2, 
##D                 dodge.width = 0.65  ## needs to be same as dodge
##D                 ),
##D             color = "darkgrey"),
##D           emmeans_arg = list(model = "multivariate")) +
##D   ggplot2::theme_classic()
##D 
##D # with color instead of linetype to separate trace factor
##D afex_plot(a1, ~hour, ~treatment, ~phase, 
##D           mapping = c("shape", "color"),
##D           dodge = 0.65, 
##D           data_arg = list(
##D             position = 
##D               ggplot2::position_jitterdodge(
##D                 jitter.width = 0, 
##D                 jitter.height = 0.2, 
##D                 dodge.width = 0.65  ## needs to be same as dodge
##D                 )),
##D           emmeans_arg = list(model = "multivariate")) +
##D   ggplot2::theme_light()
##D 
##D # only color to separate trace factor
##D afex_plot(a1, ~hour, ~treatment, ~phase, 
##D           mapping = "color",
##D           dodge = 0.65, 
##D           data_arg = list(
##D             position = 
##D               ggplot2::position_jitterdodge(
##D                 jitter.width = 0, 
##D                 jitter.height = 0.2, 
##D                 dodge.width = 0.65  ## needs to be same as dodge
##D                 )),
##D           emmeans_arg = list(model = "multivariate")) +
##D   ggplot2::theme_classic()
##D 
##D 
##D ## plot involving all 4 factors:
##D afex_plot(a1, ~hour, ~treatment, ~gender+phase, 
##D           dodge = 0.65, 
##D           data_arg = list(
##D             position = 
##D               ggplot2::position_jitterdodge(
##D                 jitter.width = 0, 
##D                 jitter.height = 0.2, 
##D                 dodge.width = 0.65  ## needs to be same as dodge
##D                 ),
##D             color = "darkgrey"),
##D           emmeans_arg = list(model = "multivariate")) +
##D   ggplot2::theme_bw()
##D 
##D 
##D ##---------------------------------------------------------------
##D ##              Different Standard Errors Available             -
##D ##---------------------------------------------------------------
##D 
##D ## purely within-design
##D cbind(
##D   afex_plot(a1, ~phase, ~hour, 
##D             error = "model", return = "data")$means[,c("phase", "hour", "y", "SE")],
##D   multivariate = afex_plot(a1, ~phase, ~hour, 
##D                            emmeans_arg = list(model = "multivariate"),
##D                            error = "model", return = "data")$means$error,
##D   mean = afex_plot(a1, ~phase, ~hour, 
##D                     error = "mean", return = "data")$means$error,
##D   within = afex_plot(a1, ~phase, ~hour, 
##D                      error = "within", return = "data")$means$error,
##D   between = afex_plot(a1, ~phase, ~hour, 
##D                       error = "between", return = "data")$means$error)
##D ## mixed design
##D cbind(
##D   afex_plot(a1, ~phase, ~treatment, 
##D             error = "model", return = "data")$means[,c("phase", "treatment", "y", "SE")],
##D   multivariate = afex_plot(a1, ~phase, ~treatment, 
##D                            emmeans_arg = list(model = "multivariate"),
##D                            error = "model", return = "data")$means$error,
##D   mean = afex_plot(a1, ~phase, ~treatment, 
##D                     error = "mean", return = "data")$means$error,
##D   within = afex_plot(a1, ~phase, ~treatment, 
##D                      error = "within", return = "data")$means$error,
##D   between = afex_plot(a1, ~phase, ~treatment, 
##D                       error = "between", return = "data")$means$error)
## End(Not run)

##################################################################
##                         Mixed Models                         ##
##################################################################

data("Machines", package = "MEMSS") 
m1 <- mixed(score ~ Machine + (Machine|Worker), data=Machines)

pairs(emmeans::emmeans(m1, "Machine"))
# contrast   estimate       SE df t.ratio p.value
# A - B     -7.966667 2.420850  5  -3.291  0.0481
# A - C    -13.916667 1.540100  5  -9.036  0.0007
# B - C     -5.950000 2.446475  5  -2.432  0.1253

## Default (i.e., model-based) error bars suggest no difference between Machines.
## This contrasts with pairwise comparisons above.
afex_plot(m1, "Machine")

## Impression from within-subject error bars is more in line with pattern of differences.
afex_plot(m1, "Machine", error = "within")


## Not run: 
##D data("fhch2010") # load 
##D fhch <- droplevels(fhch2010[ fhch2010$correct,]) # remove errors
##D ### following model should take less than a minute to fit:
##D mrt <- mixed(log_rt ~ task*stimulus*frequency + (stimulus*frequency||id)+
##D                (task||item), fhch, method = "S", expand_re = TRUE)
##D 
##D ## way too many points in background:
##D afex_plot(mrt, "stimulus", "frequency", "task") 
##D 
##D ## better to restrict plot of data to one random-effects grouping variable
##D afex_plot(mrt, "stimulus", "frequency", "task", random = "id")
##D ## when plotting data from a single random effect, different error bars are possible:
##D afex_plot(mrt, "stimulus", "frequency", "task", random = "id", error = "within")
##D afex_plot(mrt, "stimulus", "frequency", "task", random = "id", error = "mean")
##D 
##D ## compare visual impression with:
##D pairs(emmeans::emmeans(mrt, c("stimulus", "frequency"), by = "task"))
##D 
##D ## same logic also possible for other random-effects grouping factor
##D afex_plot(mrt, "stimulus", "frequency", "task", random = "item")
##D ## within-item error bars are misleading here. task is sole within-items factor.
##D afex_plot(mrt, "stimulus", "frequency", "task", random = "item", error = "within")
##D ## CIs based on stanard error of mean look small, but not unreasonable given results.
##D afex_plot(mrt, "stimulus", "frequency", "task", random = "item", error = "mean")
##D 
##D ### compare distribution of individual data for different random effects:
##D ## requires package cowplot
##D p_id <- afex_plot(mrt, "stimulus", "frequency", "task", random = "id", 
##D                   error = "within", dodge = 0.7,
##D                   data_geom = ggplot2::geom_violin, 
##D                   mapping = c("shape", "fill"),
##D                   data_arg = list(width = 0.7)) +
##D   ggplot2::scale_shape_manual(values = c(4, 17)) +
##D   ggplot2::labs(title = "ID")
##D 
##D p_item <- afex_plot(mrt, "stimulus", "frequency", "task", random = "item", 
##D           error = "within", dodge = 0.7,
##D           data_geom = ggplot2::geom_violin, 
##D           mapping = c("shape", "fill"),
##D           data_arg = list(width = 0.7)) +
##D   ggplot2::scale_shape_manual(values = c(4, 17)) +
##D   ggplot2::labs(title = "Item")
##D 
##D ### see: https://cran.r-project.org/package=cowplot/vignettes/shared_legends.html
##D p_comb <- cowplot::plot_grid(
##D   p_id + ggplot2::theme_light() + ggplot2::theme(legend.position="none"),
##D   p_item + ggplot2::theme_light() + ggplot2::theme(legend.position="none")
##D   )
##D legend <- cowplot::get_legend(p_id + ggplot2::theme(legend.position="bottom"))
##D cowplot::plot_grid(p_comb, legend, 
##D                    ncol = 1, 
##D                    rel_heights = c(1, 0.1))
##D 
##D ##----------------------------------------------------------------
##D ##                    Support for lme4::lmer                     -
##D ##----------------------------------------------------------------
##D 
##D Oats <- nlme::Oats
##D ## afex_plot does currently not support implicit nesting: (1|Block/Variety)
##D ## Instead, we need to create the factor explicitly
##D Oats$VarBlock <- Oats$Variety:Oats$Block
##D Oats.lmer <- lmer(yield ~ Variety * factor(nitro) + (1|VarBlock) + (1|Block),
##D                         data = Oats)
##D afex_plot(Oats.lmer, "nitro", "Variety")
##D afex_plot(Oats.lmer, "nitro", panel = "Variety")
##D 
## End(Not run)



