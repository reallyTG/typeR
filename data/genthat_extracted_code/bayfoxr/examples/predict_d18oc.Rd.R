library(bayfoxr)


### Name: predict_d18oc
### Title: Predict d18O of foram calcite given seawater temperature and
###   seawater d18O.
### Aliases: predict_d18oc

### ** Examples

# Infer d18Oc for a G. bulloides core top sample using annual hierarchical model.
# The true, d18Oc for this sample is -2.16 (‰ VPDB).
delo_ann <- predict_d18oc(seatemp=28.6, d18osw=0.48, foram="G. bulloides")
head(quantile(delo_ann, probs=c(0.159, 0.5, 0.841)))  # ± 1 standard deviation

# Now using seasonal hierarchical model:
delo_sea <- predict_d18oc(seatemp=28.6, d18osw=0.48, foram="G. bulloides",
                          seasonal_seatemp = TRUE)
head(quantile(delo_sea, probs=c(0.159, 0.5, 0.841)))  # ± 1 standard deviation




