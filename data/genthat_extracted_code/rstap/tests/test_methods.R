context("methods for stapreg objects")
ITER <- 10
CHAINS <- 2
REFRESH <- 0
SW <- suppressWarnings
distdata <- homog_longitudinal_bef_data[,c("subj_ID","measure_ID","class","dist")]
timedata <- homog_longitudinal_bef_data[,c("subj_ID","measure_ID","class","time")]
timedata$time <- as.numeric(timedata$time)
capture_output(
    stap_glm1 <- SW(stap_glm(formula = y ~ sex + sap(Fast_Food),
                      subject_data = homog_subject_data,
                      distance_data = homog_distance_data,
                      family = gaussian(link = 'identity'),
                      subject_ID = 'subj_id',
                      prior = normal(location = 0, scale = 5, autoscale = F),
                      prior_intercept = normal(location = 25, scale = 5, autoscale = F),
                      prior_stap = normal(location = 0, scale = 3, autoscale = F),
                      prior_theta = log_normal(location = 1, scale = 1),
                      prior_aux = cauchy(location = 0,scale = 5),
                      max_distance = max(homog_distance_data$Distance),
                      chains = CHAINS, iter = ITER,
                      refresh = -1,verbose = F))
    )

capture_output(
               SW(stap_glmer1 <- stap_glmer(y_bern ~ centered_income +  sex + centered_age + stap(Coffee_Shop) + (1|subj_ID),
                          family = binomial(link='logit'),
                          subject_data = homog_longitudinal_subject_data,
                          distance_data = distdata,
                          time_data = timedata,
                          subject_ID = 'subj_ID',group_ID = 'measure_ID',
                          prior_intercept = normal(location = 25, scale = 4, autoscale = F),
                          prior = normal(location = 0, scale = 4, autoscale=F),
                          prior_stap = normal(location = 0, scale = 4),
                          prior_theta = list(Coffee_Shop = list(spatial = log_normal(location = 1,
                                                                                     scale = 1),
                                                                temporal = log_normal(location = 1, 
                                                                                      scale = 1))),
                          max_distance = 3, max_time = 50,
                          chains = CHAINS, refresh = -1, verbose = F, 
                          iter = ITER, cores = 1))
               )

capture_output(
    stap_lmer1 <- SW(stap_lmer(y ~ centered_income + sex + centered_age + stap(Coffee_Shop) + (1|subj_ID),
                            subject_data = homog_longitudinal_subject_data,
                            distance_data = distdata,
                            time_data = timedata,
                            subject_ID = 'subj_ID', group_ID = "measure_ID",
                            prior_intercept = normal(location = 25, scale = 4, autoscale = F),
                            prior = normal(location = 0, scale = 4, autoscale = F),
                            prior_stap = normal(location = 0, scale = 4),
                            prior_theta = log_normal(1,2),
                            max_distance = 3, max_time = 50,
                            chains = CHAINS, refresh = -1, verbose = F, iter = ITER, cores = 1))
    )


capture_output(
    glm1 <- glm(y~sex,data=homog_subject_data,family=gaussian())
)

capture_output(
    glmer1 <- lme4::lmer(formula = y ~ centered_income + sex + centered_age + Coffee_Shop + (1|subj_ID),
                    data = homog_longitudinal_subject_data)
    )

capture_output(
    lmer1 <- lme4::lmer(y ~ centered_income + sex + centered_age + Coffee_Shop + (1|subj_ID),
                  data = homog_longitudinal_subject_data)
    )


att_names <- function(object) {
  nms <- names(object)
  att_nms <- names(attributes(object))
  att_nms2 <- lapply(object, function(x) names(attributes(x)))
  c(nms, att_nms, att_nms2)
}

check_att_names <- function(x,y) {
    expect_identical(att_names(x), att_names(y))
}

check_sizes <- function(x,y) {
    expect_equal(length(x), length(y))
    expect_equal(lapply(x, dim), lapply(y, dim))
}



# extractors --------------------------------------------------------------
test_that("stapreg extractor methods work properly", {
    expect_equal(resid(stap_glm1), stap_glm1$residuals)
    expect_equal(coef(stap_glm1), stap_glm1$coefficients)
    expect_equal(vcov(stap_glm1), stap_glm1$covmat)
    expect_equal(fitted(stap_glm1), stap_glm1$fitted.values)
    expect_equal(se(stap_glm1), stap_glm1$ses)
    
    expect_equal(resid(stap_glmer1),stap_glmer1$residuals)
    expect_equal(fitted(stap_glmer1), stap_glmer1$fitted.values)
    expect_equal(se(stap_glmer1), stap_glmer1$ses)
    
    
    expect_error(confint(stap_glm1), regexp = "use posterior_interval")
    expect_error(confint(stap_glmer1), regexp = "use posterior_interval")
})


# posterior_interval ------------------------------------------------------
test_that("posterior_interval returns correct structure",{
    expect_silent(ci <- posterior_interval(stap_glm1, prob = 0.5))
    expect_silent(ci2 <- posterior_interval(stap_glm1, prob = 0.95, regex_pars = "sex"))
    expect_identical(rownames(ci),c("(Intercept)","sexF","Fast_Food","Fast_Food_spatial_scale","sigma"))
    expect_identical(rownames(ci2),c("sexF"))
    
    expect_silent(ci3 <- posterior_interval(stap_glmer1, prob = .95, regex_pars = "sex"))
    expect_identical(rownames(ci3),c("sex"))
})

# ngrps, nobs -------------------------------------------------------------


test_that("ngrps is right", {
    expect_error(ngrps(stap_glm1), "stan_glmer and stan_lmer models only")
    expect_equal(ngrps(stap_glmer1),ngrps(glmer1))
    
})


test_that("nobs is right", {
    expect_equal(nobs(stap_glm1), nrow(homog_subject_data))
    expect_equal(nobs(stap_glmer1),nrow(homog_longitudinal_subject_data))
    expect_equal(nobs(stap_glmer1),nobs(glmer1))
})

# vcov --------------------------------------------------------------------

test_that("vcov returns correct structure", {
    expect_equal(rownames(vcov(stap_glm1)), c("(Intercept)","sexF","Fast_Food","Fast_Food_spatial_scale"))
    expect_equal(rownames(vcov(stap_glmer1)), c("(Intercept)","centered_income","sex","centered_age",
                                                "Coffee_Shop","Coffee_Shop_spatial_scale",
                                              "Coffee_Shop_temporal_scale"))
    expect_equal(rownames(vcov(stap_glmer1))[1:5],rownames(vcov(glmer1)))
})



# sigma -------------------------------------------------------------------

test_that("sigma method works",{
    expect_double <- function(x) expect_type(x, "double")
    expect_double(sig <- sigma(stap_glm1))
    expect_false(identical(sig, 1))
    expect_double(sig2 <- sigma(stap_glmer1))
    expect_false(identical(sig,1))
})

# VarCorr -----------------------------------------------------------------
test_that("VarCorr returns correct structure", {
    vc_glmer1 <- VarCorr(glmer1); vc_stap1 <- VarCorr(stap_glmer1)
    expect_s3_class(vc_stap1, class(vc_glmer1))
    expect_error(VarCorr(stap_glm1), "stan_glmer and stan_lmer models only")
    check_att_names(vc_stap1, vc_glmer1)
    v <- sapply(vc_stap1, "[[",1)
    expect_true(length(unique(v)) == length(v))
})

# ranef,fixef,coef --------------------------------------------------------
test_that("ranef returns correct structure", {
    expect_error(ranef(stap_glm1), "stan_glmer and stan_lmer models only")
    re_stap1 <- ranef(stap_glmer1);re_glmer1 <- ranef(glmer1, condVar=FALSE)
    expect_s3_class(re_stap1,class(re_glmer1))
    check_att_names(re_stap1,re_glmer1)

})


test_that("fixef returns the right coefs",{
    expect_identical(names(fixef(stap_lmer1)),c(names(fixef(lmer1)),"Coffee_Shop_spatial_scale","Coffee_Shop_temporal_scale"))
    expect_identical(names(fixef(stap_glmer1)),c(names(fixef(glmer1)),"Coffee_Shop_spatial_scale","Coffee_Shop_temporal_scale"))
})

test_that("coef returns the right structure", {
    coef_stap <- coef(stap_glmer1); coef_glmer1 <- coef(glmer1)
    check_att_names(coef_stap,coef_glmer1)
    check_att_names(coef_stap,coef_glmer1)
})


# as.matrix,as.data.frame,as.array ----------------------------------------
test_that("as.matrix, as.data.frame, as.array methods work for MCMC", {
    last_dimnames <- rstap:::last_dimnames
    # glm
    mat <- as.matrix(stap_glm1)
    df <- as.data.frame(stap_glm1)
    arr <- as.array(stap_glm1)
    expect_identical(df, as.data.frame(mat))
    expect_identical(mat[1:2, 1], arr[1:2, 1, 1])
    expect_equal(dim(mat), c(floor(ITER/2) * CHAINS, 5L))
    expect_equal(dim(arr), c(floor(ITER/2), CHAINS, 5L))
    expect_identical(last_dimnames(mat), c("(Intercept)", "sexF", "Fast_Food", "Fast_Food_spatial_scale",
                                           "sigma"))
    expect_identical(last_dimnames(arr), last_dimnames(mat))
    
    # selecting only 1 parameter
    mat <- as.matrix(stap_glm1, pars = "sexF")
    df <- as.data.frame(stap_glm1, pars = "sexF")
    arr <- as.array(stap_glm1, pars = "sexF")
    expect_identical(df, as.data.frame(mat))
    expect_identical(mat[1:2, 1], arr[1:2, 1, 1])
    expect_equal(dim(mat), c(floor(ITER/2) * CHAINS, 1L))
    expect_equal(dim(arr), c(floor(ITER/2), CHAINS, 1L))
    expect_identical(last_dimnames(mat), "sexF")
    expect_identical(last_dimnames(arr), last_dimnames(mat))
    
    # pars & regex_pars
    nr <- posterior_sample_size(stap_glm1)
    mat <- as.matrix(stap_glm1, pars = "sexF", regex_pars = "Fast_Food")
    df <- as.data.frame(stap_glm1, pars = "sexF", regex_pars = "Fast_Food")
    arr <- as.array(stap_glm1, pars = "sexF", regex_pars = "Fast_Food")
    expect_identical(df, as.data.frame(mat))
    expect_identical(mat[1:2, 1], arr[1:2, 1, 1])
    expect_equal(dim(mat), c(nr, 3L))
    expect_equal(dim(arr), c(nr/2, 2, 3L))
    expect_identical(last_dimnames(mat), c("sexF", "Fast_Food","Fast_Food_spatial_scale"))
    expect_identical(last_dimnames(mat), last_dimnames(arr))
    
    #glmer
    mat <- as.matrix(stap_glmer1)
    df <- as.data.frame(stap_glmer1)
    arr <- as.array(stap_glmer1)
    expect_identical(df,as.data.frame(mat))
    expect_identical(mat[1:2,1],arr[1:2,1,1])
    # nc <- length(c(fixef(stap_glmer1), unlist(ranef(stap_glmer1)))) + 1L
    # nr <- posterior_sample_size(stap_glmer1)
    # nms <- rownames(summary(stap_glmer1))[seq_len(nc)]
    # expect_equal(dim(mat), c(nr,nc))
    # expect_equal(dim(arr), c(nr/2, 2, nc))
    # expect_identical(last_dimnames(mat), nms)
    expect_identical(last_dimnames(mat), last_dimnames(arr))
    
    #lmer 
    mat <- as.matrix(stap_lmer1)
    df <- as.data.frame(stap_lmer1)
    arr <- as.array(stap_lmer1)
    expect_identical(df,as.data.frame(mat))
    expect_identical(mat[1:2,1],arr[1:2,1,1])
    # nc <- length(c(fixef(stap_lmer1), unlist(ranef(stap_lmer1)))) + 1L
    # nr <- posterior_sample_size(stap_lmer1)
    # nms <- rownames(summary(stap_lmer1))[seq_len(nc)]
    # expect_equal(dim(mat), c(nr,nc))
    # expect_equal(dim(arr), c(nr/2, 2, nc))
    # expect_identical(last_dimnames(mat), nms)
    expect_identical(last_dimnames(mat), last_dimnames(arr))
})

# terms, formula, model.frame, model.matrix methods  --------------

# context("model.frame methods")
test_that("model.frame works properly", {
    expect_identical(model.frame(stap_glm1), model.frame(glm1))
})

# context("terms methods")
test_that("terms works properly", {
    expect_identical(terms(stap_glm1), terms(glm1))
})

# context("formula methods")
test_that("formula works properly", {
    expect_equal(formula(stap_glm1), as.formula(y~sex + sap(Fast_Food)))
    expect_equal(formula(stap_glmer1),as.formula(y_bern ~centered_income + sex + centered_age +  (1|subj_ID)))
})

## no update method yet


# print and summary -------------------------------------------------------


test_that("print and summary methods work ok for stap_glm", {
    expect_output(print(stap_glm1, digits = 2), "stap_glm")
    expect_output(print(stap_glm1, digits = 2), 'sigma')
    expect_silent(s <- summary(stap_glm1))
    expect_silent(d <- as.data.frame(s))
    expect_s3_class(s,"summary.stapreg")
    expect_identical(colnames(s),colnames(d))
    expect_identical(rownames(s),rownames(d))
    expect_output(print(stap_glmer1, digits = 2), "stap_glmer")
    expect_output(print(stap_lmer1, digits = 2), "stap_lmer")
    
    expect_silent(s <- summary(stap_lmer1))
    expect_silent(d <- as.data.frame(s))
    expect_s3_class(s, "summary.stapreg")
    expect_output(print(s), "stap_lmer")
    expect_identical(colnames(s), colnames(d))
    expect_identical(rownames(s), rownames(d))
    
    expect_warning(s <- summary(stap_glm1, pars = "varying"),
                   regexp = "No group-specific parameters. 'varying' ignored.")
    expect_silent(s <- summary(stap_glm1, pars = c("alpha","beta"), digits = 3))
    expect_s3_class(s, "summary.stapreg")
    expect_output(print(s), "stap_glm")
    
})


# prior_summary -----------------------------------------------------------
test_that("prior_summary doesn't error", {
    expect_output(print(prior_summary(stap_glm1, digits = 2)),
                  "Priors for model 'stap_glm1'")
})

test_that("prior_summary returns correctly named list", {
    expect_named(prior_summary(stap_glm1),
                 c("prior", "prior_stap", "prior_theta", "prior_intercept", "prior_aux"))
})


# predictive_error,predictive_interval ------------------------------------
test_that("predictive_interval works", {
              expect_error(predictive_interval(stap_glm1, draws = 100),
                           "'draws' should be <= posterior sample size")
              expect_error(predictive_interval(stap_glm1, prob = c(.25, .76)),
                           "'prob' should be a single number greater than 0 and less than 1")
              pint1 <- predictive_interval(stap_glm1, draws = 5)
              pint2 <- predictive_interval(stap_glmer1, draws = 5)
              expect_equal(dim(pint1), c(nobs(stap_glm1),2), info = stap_glm1)
              expect_identical(colnames(pint1), c("5%", "95%"), info = stap_glm1)
})

