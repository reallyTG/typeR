## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----describe------------------------------------------------------------
# Define data
data <- bfw::Cats
# Aggregate data
aggregate.data <- stats::aggregate(list(Ratings = data$Ratings),
                                   by=list(Reward = data$Reward ,
                                           Dance = data$Dance ,
                                           Alignment = data$Alignment),
                                   FUN=function(x) c(Mean = mean(x), SD = sd(x)))
# Describe data
describe.data <- psych::describe(data)[,c(2:5,10:12)]
describe.data

# Print data
print(aggregate.data, digits = 3)

## ----metric1, eval = FALSE-----------------------------------------------
#  # Use the three categorical variables and mixed contrast.
#  mcmc <- bfw::bfw(project.data = data,
#              y = "Ratings",
#              x = "Reward,Dance,Alignment",
#              saved.steps = 50000,
#              jags.model = "metric",
#              run.contrasts = TRUE,
#              use.contrast = "mixed",
#              contrasts = "1,2,3",
#              jags.seed = 100,
#              silent = TRUE)
#  
#  # ... and just show the most likely parameter estimate of effect sizes.
#  round(normal$summary.MCMC[grep("Effect size:",
#                           rownames(normal$summary.MCMC)), c(2,5:7)],3)
#  #                                                      Median  HDIlo  HDIhi    n
#  # Effect size: Food/Affection                          -0.832 -0.992 -0.667 2000
#  # Effect size: No/Yes                                  -0.012 -0.163  0.148 2000
#  # Effect size: Evil/Good                               -1.600 -1.775 -1.419 2000
#  # Effect size: Food/Affection @ No                     -0.893 -1.151 -0.632 1240
#  # Effect size: Food vs. No/Yes                         -0.079 -0.248  0.100  380
#  # Effect size: Food/Affection vs. No/Yes               -0.830 -1.015 -0.650 2000
#  # Effect size: Affection/Food vs. No/Yes                0.836  0.571  1.110 2000
#  # Effect size: Affection vs. No/Yes                     0.035 -0.194  0.274 1620
#  # Effect size: Food/Affection @ Yes                    -0.773 -0.968 -0.582  760
#  # Effect size: Food/Affection @ Evil                   -4.007 -4.458 -3.541 1299
#  # Effect size: Food vs. Evil/Good                      -5.320 -5.696 -4.952  380
#  # Effect size: Food/Affection vs. Evil/Good            -2.500 -2.811 -2.186 2000
#  # Effect size: Affection/Food vs. Evil/Good            -0.725 -0.940 -0.506 2000
#  # Effect size: Affection vs. Evil/Good                  1.134  0.882  1.393 1620
#  # Effect size: Food/Affection @ Good                    1.911  1.663  2.154  701
#  # Effect size: No/Yes @ Evil                            0.168 -0.082  0.401 1299
#  # Effect size: No vs. Evil/Good                        -1.445 -1.712 -1.169 1240
#  # Effect size: No/Yes vs. Evil/Good                    -1.573 -1.831 -1.323 2000
#  # Effect size: Yes/No vs. Evil/Good                    -1.631 -1.878 -1.380 2000
#  # Effect size: Yes vs. Evil/Good                       -1.752 -1.974 -1.532  760
#  # Effect size: No/Yes @ Good                           -0.164 -0.357  0.033  701
#  # Effect size: Food/Affection @ No @ Evil              -3.971 -4.708 -3.192 1063
#  # Effect size: Food vs. No/Yes @ Evil                   0.147 -0.148  0.442  230
#  # Effect size: Food/Affection vs. No/Yes @ Evil        -3.969 -4.301 -3.634 1299
#  # Effect size: Food @ No vs. Evil/Good                 -5.040 -5.530 -4.549  100
#  # Effect size: Food/Affection @ No vs. Evil/Good       -2.543 -2.964 -2.095 1240
#  # Effect size: Food vs. No/Yes vs. Evil/Good           -5.530 -5.811 -5.253  380
#  # Effect size: Food/Affection vs. No/Yes vs. Evil/Good -2.381 -2.734 -1.999 2000
#  # Effect size: Affection/Food vs. No/Yes @ Evil         4.049  3.216  4.892 1299
#  # Effect size: Affection vs. No/Yes @ Evil              0.181 -0.153  0.508 1069
#  # Effect size: Affection/Food @ No vs. Evil/Good       -0.499 -0.879 -0.135 1240
#  # Effect size: Affection @ No vs. Evil/Good             1.301  0.888  1.735 1140
#  # Effect size: Affection/Food vs. No/Yes vs. Evil/Good -0.735 -1.073 -0.376 2000
#  # Effect size: Affection vs. No/Yes vs. Evil/Good       1.103  0.709  1.494 1620
#  # Effect size: Food/Affection @ Yes @ Evil             -4.059 -4.539 -3.586  236
#  # Effect size: Food vs. Yes/No vs. Evil/Good           -5.120 -5.792 -4.475  380
#  # Effect size: Food/Affection vs. Yes/No vs. Evil/Good -2.636 -3.147 -2.119 2000
#  # Effect size: Food @ Yes vs. Evil/Good                -5.624 -6.197 -5.065  280
#  # Effect size: Food/Affection @ Yes vs. Evil/Good      -2.468 -2.913 -2.031  760
#  # Effect size: Affection/Food vs. Yes/No vs. Evil/Good -0.718 -0.944 -0.482 2000
#  # Effect size: Affection vs. Yes/No vs. Evil/Good       1.171  0.865  1.479 1620
#  # Effect size: Affection/Food @ Yes vs. Evil/Good      -0.970 -1.157 -0.788  760
#  # Effect size: Affection @ Yes vs. Evil/Good            0.972  0.699  1.230  480
#  # Effect size: Food/Affection @ No @ Good               1.923  1.554  2.297  177
#  # Effect size: Food vs. No/Yes @ Good                  -0.242 -0.446 -0.036  150
#  # Effect size: Food/Affection vs. No/Yes @ Good         1.649  1.317  1.971  701
#  # Effect size: Affection/Food vs. No/Yes @ Good        -2.209 -2.565 -1.843  701
#  # Effect size: Affection vs. No/Yes @ Good             -0.102 -0.402  0.200  551
#  # Effect size: Food/Affection @ Yes @ Good              1.899  1.586  2.196  524

## ----describe2-----------------------------------------------------------
# Let's print the aggregate table again.
print(aggregate.data, digits = 3)

