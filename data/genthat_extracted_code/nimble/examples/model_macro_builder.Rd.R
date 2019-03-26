library(nimble)


### Name: model_macro_builder
### Title: EXPERIMENTAL: Turn a function into a model macro builder A model
###   macro expands one line of code in a nimbleModel into one or more new
###   lines. This supports compact programming by defining re-usable
###   modules. 'model_macro_builder' takes as input a function that
###   constructs new lines of model code from the original line of code.
###   It returns a function suitable for internal use by 'nimbleModel' that
###   arranges arguments for input function.  Macros are an experimental
###   feature and are available only after setting
###   'nimbleOptions(enableModelMacros = TRUE)'.
### Aliases: model_macro_builder

### ** Examples

nimbleOptions(enableModelMacros = TRUE)
nimbleOptions(verbose = FALSE)

## Example 1: Say one is tired of writing "for" loops.
## This macro will generate a "for" loop with dnorm declarations
all_dnorm <- model_macro_builder(
    function(stoch, LHS, RHSvar, start, end, sd = 1) {
        newCode <- substitute(
            for(i in START:END) {
                LHS[i] ~ dnorm(RHSvar[i], SD)
            },
            list(START = start,
                 END = end,
                 LHS = LHS,
                 RHSvar = RHSvar,
                 SD = sd))
        list(code = newCode)
    },
    use3pieces = TRUE,
    unpackArgs = TRUE 
)

model1 <- nimbleModel(
    nimbleCode(
    {
        ## Create a "for" loop of dnorm declarations by invoking the macro
        x ~ all_dnorm(mu, start = 1, end = 10)
    }
    ))

## show code from expansion of macro
model1$getCode()
## The result should be:
## {
##     for (i in 1:10) {
##         x[i] ~ dnorm(mu[i], 1)
##     }
## }

## Example 2: Say one is tired of writing priors.
## This macro will generate a set of priors in one statement
flat_normal_priors <- model_macro_builder(
    function(...) {
        allVars <- list(...)
        priorDeclarations <- lapply(allVars,
                                    function(x)
                                        substitute(VAR ~ dnorm(0, sd = 1000),
                                                   list(VAR = x)))
        newCode <- quote({})
        newCode[2:(length(allVars)+1)] <- priorDeclarations
        list(code = newCode)
    },
    use3pieces = FALSE,
    unpackArgs = TRUE
)

model2 <- nimbleModel(
    nimbleCode(
    {
        flat_normal_priors(mu, beta, gamma)
    }
    ))

## show code from expansion of macro
model2$getCode()
## The result should be:
## {
##     {
##         mu ~ dnorm(0, sd = 1000)
##         beta ~ dnorm(0, sd = 1000)
##         gamma ~ dnorm(0, sd = 1000)
##     }
## }
## Extra curly braces do not matter.



