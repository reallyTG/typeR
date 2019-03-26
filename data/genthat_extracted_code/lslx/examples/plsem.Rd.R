library(lslx)


### Name: plsem
### Title: S3 interface for semi-confirmatory SEM via PL
### Aliases: plsem

### ** Examples

## EXAMPLE: Semi-Confirmatory Factor Analysis with lavaan Style ##
# specify a factor analysis model with lavaan style
model_fa <- "visual  =~ x1 + x2 + x3
             textual =~ x4 + x5 + x6
             speed   =~ x7 + x8 + x9
             pen() * visual  =~ x4 + x5 + x6 + x7 + x8 + x9
             pen() * textual =~ x1 + x2 + x3 + x7 + x8 + x9
             pen() * speed   =~ x1 + x2 + x3 + x4 + x5 + x6
             visual  ~~ 1 * visual
             textual ~~ 1 * textual
             speed   ~~ 1 * speed"
             
# fit with mcp under specified penalty levels and convexity levels
lslx_fa <- plsem(model = model_fa, 
                 data = lavaan::HolzingerSwineford1939,
                 penalty_method = "mcp", 
                 lambda_grid = seq(.02, .60, .02), 
                 delta_grid = c(1.5, 3.0, Inf))

# summarize fitting result under the penalty level selected by 'bic'
summary(lslx_fa, selector = "bic")




