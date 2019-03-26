## ----setup, include = FALSE-----------------------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  fig.width = 7,
  fig.align = 'center'
)
library(JointAI)
options(width = 100)

## ---- echo = FALSE--------------------------------------------------------------------------------
tab <- rbind(gaussian = "with links: `identity`, `log`",
             binomial = "with links: `logit`, `probit`, `log`, `cloglog`",
             Gamma	= "with links: `identity`, `log`",
             poisson	= "with links: `log`, `identity`"
)

tab <- cbind(paste0("`", rownames(tab), "`"), tab)
colnames(tab) <- c('family', ' ')

knitr::kable(tab, row.names = FALSE)

## -------------------------------------------------------------------------------------------------
mod1a <- glm_imp(educ ~ age + gender + creat, data = NHANES,
               family = "binomial", n.adapt = 0, mess = FALSE)

mod1b <- glm_imp(educ ~ age + gender + creat, data = NHANES,
               family = binomial(), n.adapt = 0, mess = FALSE)

mod1c <- glm_imp(educ ~ age + gender + creat, data = NHANES,
               family = binomial(link = 'logit'), n.adapt = 0, mess = FALSE)

mod1a$analysis_type

## -------------------------------------------------------------------------------------------------
mod1d <- glm_imp(educ ~ age + gender + creat, data = NHANES,
               family = binomial(link = 'probit'), n.adapt = 0, mess = FALSE)

mod1d$analysis_type

## ---- eval = FALSE--------------------------------------------------------------------------------
#  SBP ~ age + gender + smoke * creat

## ---- eval = FALSE--------------------------------------------------------------------------------
#  SBP ~ age + gender + smoke + creat + smoke:creat

## -------------------------------------------------------------------------------------------------
mod2a <- glm_imp(educ ~ gender * (age + smoke + creat),
                 data = NHANES, family = binomial(), mess = FALSE, n.adapt = 0)

parameters(mod2a, mess = FALSE)

## ----multi-way interactions-----------------------------------------------------------------------
# all two-way interactions:
mod2b <- glm_imp(educ ~ gender + (age + smoke + creat)^2,
                 data = NHANES, family = binomial(), mess = FALSE, n.adapt = 0)

parameters(mod2b, mess = FALSE)

# all two- and three-way interactions:
mod2c <- glm_imp(educ ~ gender + (age + smoke + creat)^3,
                 data = NHANES, family = binomial(), mess = FALSE, n.adapt = 0)

parameters(mod2c, mess = FALSE)

## -------------------------------------------------------------------------------------------------
# Absolute difference between bili and creat
mod3a <- lm_imp(SBP ~ age + gender + abs(bili - creat),
                data = NHANES, mess = FALSE)

# Using a natural cubic spline for age (completely observed) and a quadratic
# and a cubic effect for bili
library(splines)
mod3b <- lm_imp(SBP ~ ns(age, df = 2) + gender + I(bili^2) + I(bili^3),
                data = NHANES, mess = FALSE, keep_model = TRUE)

# A function of creat and albu
mod3c <- lm_imp(SBP ~ age + gender + I(creat/albu^2),
                data = NHANES, mess = FALSE)
# This function may make more sense to calculate BMI as weight/height^2, but
# we do not have those variables in the NHANES data...

# Using the sinus and cosinus
mod3d <- lm_imp(SBP ~ bili + sin(creat) + cos(albu),
                data = NHANES, mess = FALSE)

## -------------------------------------------------------------------------------------------------
list_impmodels(mod3b, priors = FALSE, regcoef = FALSE, otherpars = FALSE)

## -------------------------------------------------------------------------------------------------
mod3e <- lm_imp(SBP ~ age + gender + bili, auxvars = "I(WC^2)",
                data = NHANES, mess = FALSE)

list_impmodels(mod3e, priors = F, regcoef = F, otherpars = F)

## -------------------------------------------------------------------------------------------------
# truncation of the distribution of  bili
mod4a <- lm_imp(SBP ~ age + gender + log(bili) + exp(creat),
                trunc = list(bili = c(1e-5, 1e10)),
                data = NHANES, mess = FALSE, keep_model = T)

# log-normal model for bili
mod4b <- lm_imp(SBP ~ age + gender + log(bili) + exp(creat),
                meth = c(bili = 'lognorm', creat = 'norm'),
                data = NHANES, mess = FALSE, keep_model = T)

# gamma model for bili
mod4c <- lm_imp(SBP ~ age + gender + log(bili) + exp(creat),
                meth = c(bili = 'gamma', creat = 'norm'),
                data = NHANES, mess = FALSE, keep_model = T)


## -------------------------------------------------------------------------------------------------
# Define the function ilogit
ilogit <- plogis

# Use ilogit in the model formula
mod5a = lm_imp(SBP ~ age + gender + ilogit(creat),
               data = NHANES, mess = FALSE)

## -------------------------------------------------------------------------------------------------
# define the complementary log log transformation
cloglog <- function(x) log(-log(1 - x))

# define the inverse logit (in case you have not done it in the previous example)
ilogit <- plogis

# nest ilogit inside cloglog
mod6a = lm_imp(SBP ~ age + gender + cloglog(ilogit(creat)),
               data = NHANES, mess = FALSE)

## -------------------------------------------------------------------------------------------------
mod7a <- lme_imp(bmi ~ GESTBIR + ETHN + HEIGHT_M + ns(age, df = 2),
                 random = ~ns(age, df = 2)|ID, 
                 data = simLong, mess = FALSE)

## ---- echo = FALSE--------------------------------------------------------------------------------
tab <- rbind(norm = c("linear regression", "continuous variables"),
             logit = c("logistic regression", "factors with two levels"),
             multilogit = c("multinomial logit model", "unordered factors with >2 levels"),
             cumlogit = c("cumulative logit model", "ordered factors with >2 levels")
)

tab <- cbind(paste0("`", rownames(tab), "`"), tab)
colnames(tab) <- c('name', 'model', 'variable type')

knitr::kable(tab, row.names = FALSE)

## ---- echo = FALSE--------------------------------------------------------------------------------
tab = rbind(lognorm = c("normal regression of the log-transformed variable",
                        "right-skewed variables >0"),
            gamma = c("Gamma regression (with log-link)",
                        "right-skewed variables >0"),
            beta = c("beta regression (with logit-link)",
                     "continuous variables with values in [0, 1]")
)
tab <- cbind(paste0("`", rownames(tab), "`"), tab)
colnames(tab) <- c('name', 'model', 'variable type')

knitr::kable(tab, row.names = FALSE)


## ---- cache = TRUE--------------------------------------------------------------------------------
mod8a <- lm_imp(SBP ~ age + gender + WC + alc + bili + occup + smoke,
                meth = c(bili = 'gamma', WC = 'lognorm'),
                data = NHANES, n.iter = 100, mess = FALSE, progress.bar = 'none')

mod8a$meth

## -------------------------------------------------------------------------------------------------
mod8a_meth <- get_imp_meth(SBP ~ age + gender + WC + alc + bili + occup + smoke,
                           data = NHANES)
mod8a_meth

## -------------------------------------------------------------------------------------------------
# number of missing values in the covariates in mod8a
colSums(is.na(NHANES[, names(mod8a_meth)]))

# print information on the imputation models (and omit everything but the predictor variables)
list_impmodels(mod8a, priors = F, regcoef = F, otherpars = F, refcat = F)

## ---- cache = TRUE--------------------------------------------------------------------------------
mod9a <- lm_imp(SBP ~ gender + age + occup, auxvars = c('educ', 'smoke'),
                data = NHANES, n.iter = 100, progress.bar = 'none', mess = FALSE)

## -------------------------------------------------------------------------------------------------
summary(mod9a)

## -------------------------------------------------------------------------------------------------
list_impmodels(mod9a, priors = FALSE, regcoef = FALSE, otherpars = FALSE, refcat = FALSE)

## -------------------------------------------------------------------------------------------------
mod9b <- lm_imp(SBP ~ gender + age + occup, data = NHANES,
                auxvars = c('educ', 'smoke', 'log(WC)'),
                trunc = list(WC = c(1e-10, 1e10)), n.adapt = 0, mess = FALSE)

## -------------------------------------------------------------------------------------------------
list_impmodels(mod9b, priors = FALSE, regcoef = FALSE, otherpars = FALSE,
               refcat = FALSE)

## -------------------------------------------------------------------------------------------------
mod10a <- lm_imp(SBP ~ gender + age + race + educ + occup + smoke,
                 refcats = "largest",
                 data = NHANES, n.adapt = 0, mess = FALSE)

## -------------------------------------------------------------------------------------------------
mod10b <- lm_imp(SBP ~ gender + age + race + educ + occup + smoke,
                 refcats = list(occup = "not working", race = 3, educ = 'largest'),
                 data = NHANES, n.adapt = 0, mess = FALSE)

## ---- echo = FALSE--------------------------------------------------------------------------------
set_refcat <- function(data, formula, covars, auxvars) {
  if (missing(formula) & missing(covars) & missing(auxvars)) {
    covars <- colnames(data)
  } else  if (missing(covars) & !missing(formula)) {
    covars <- all.vars(formula)[all.vars(formula) != JointAI:::extract_y(formula)]
  }
  if (!missing(auxvars))
    covars <- unique(c(covars, auxvars))

  factors <- covars[sapply(data[, covars, drop = FALSE], is.factor)]

  message(gettextf("The categorical variables are:\n%s",
                   paste('-', sapply(factors, dQuote), collapse = "\n")))

  cat("\nHow do you want to specify the reference categories?\n\n")
  cat(paste0('1: Use the first category for each variable.\n',
             '2: Use the last category for each variabe.\n',
             '3: Use the largest category for each variable.\n',
             '4: Specify the reference categories individually.')
  )
}

## -------------------------------------------------------------------------------------------------
refs_mod10 <- set_refcat(NHANES, formula = formula(mod10b))

## -------------------------------------------------------------------------------------------------
#> The reference category for “race” should be 
#> 
#> 1: Mexican American
#> 2: Other Hispanic
#> 3: Non-Hispanic White
#> 4: Non-Hispanic Black
#> 5: other

## -------------------------------------------------------------------------------------------------
#> In the JointAI model specify:
#>  refcats = c(gender = 'female', race = 'Non-Hispanic White', educ = 'low',
#>              occup = 'not working', smoke = 'never')
#> 
#> or use the output of this function.

## ---- echo = FALSE--------------------------------------------------------------------------------
refs_mod10 <-  c(gender = 'female', race = 'Non-Hispanic White', educ = 'low', occup = 'not working', smoke = 'never')

## -------------------------------------------------------------------------------------------------
mod10c <- lm_imp(SBP ~ gender + age + race + educ + occup + smoke,
                 refcats = refs_mod10,
                 data = NHANES, n.adapt = 0, mess = FALSE)

## -------------------------------------------------------------------------------------------------
default_hyperpars(nranef = 2)

