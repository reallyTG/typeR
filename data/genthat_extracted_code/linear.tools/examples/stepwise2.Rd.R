library(linear.tools)


### Name: stepwise2
### Title: same as 'step()' in R, but able to check marginal effects.
### Aliases: stepwise2

### ** Examples


# starting model:
# can have a dirty formula like below

set.seed(413)
traing_data = ggplot2::diamonds[runif(nrow(ggplot2::diamonds))<0.05,]
nrow(traing_data)

diamond_lm3 = lm(formula = price ~ cut + carat - cut   , data = traing_data)

scope = list(lower = price ~ 1,
             upper = price ~  I(carat^2) + I(carat^3) + I(carat * depth) + depth + carat)

# traditional stepwise regression with no marginal effect check
model1 = stepwise2(model = diamond_lm3, scope = scope,k = 2,
                   trace = TRUE, data = traing_data, STOP = TRUE)
model1
# result is exactly same using the default step() function.
model2 = suppressWarnings(step(diamond_lm3,scope = scope, k = 2))
model2


#__ How to Specify the Correct Marginal Effects in Stepwise Regression  __

# this test_suit means we will check the marginal effect of both 'carat' and 'depth'
# for 'carat', we will only focus on 4 coeff vars :
    # "I(carat^3)","I(carat*depth)","I(carat^2)","carat"
# for 'depth', as we do not specify any particular coeff vars there,
# we will check all coeff var related to 'depth'

test_suit = list(
  carat = list(
    # the list name must be the raw var
    focus_var_raw = "carat",
    # must specify the focus_var_raw (see deleting_wrongeffect() ) as the raw var
    focus_var_coeff = c("I(carat^3)","I(carat*depth)",
                        "I(carat^2)","carat") ,
    # optional # If not defined, then we to check all coeffs related to the raw var
    focus_value =list(carat = seq(0.5,6,0.1)),
    Monoton_to_Match = 1 # optional. Default is 1
  ),
  depth = list(
    focus_var_raw = "depth",
    Monoton_to_Match = 1
  )
)

model3 =  stepwise2(model = diamond_lm3, scope = scope, trace = TRUE,
                    data = traing_data,
                    STOP = FALSE, test_suit = test_suit)

# see the difference from model1
effect(model3,focus_var_raw =  "carat", focus_value =list(carat = seq(0.5,6,0.1)))




