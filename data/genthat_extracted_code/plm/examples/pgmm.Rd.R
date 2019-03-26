library(plm)


### Name: pgmm
### Title: Generalized Method of Moments (GMM) Estimation for Panel Data
### Aliases: pgmm summary.pgmm print.summary.pgmm
### Keywords: regression

### ** Examples

data("EmplUK", package = "plm")

## Arellano and Bond (1991), table 4 col. b 
z1 <- pgmm(log(emp) ~ lag(log(emp), 1:2) + lag(log(wage), 0:1)
           + log(capital) + lag(log(output), 0:1) | lag(log(emp), 2:99),
            data = EmplUK, effect = "twoways", model = "twosteps")
summary(z1, robust = FALSE)

## Blundell and Bond (1998) table 4 (cf. DPD for OX p. 12 col. 4)
z2 <- pgmm(log(emp) ~ lag(log(emp), 1)+ lag(log(wage), 0:1) +
           lag(log(capital), 0:1) | lag(log(emp), 2:99) +
           lag(log(wage), 2:99) + lag(log(capital), 2:99),        
           data = EmplUK, effect = "twoways", model = "onestep", 
           transformation = "ld")
summary(z2, robust = TRUE)

## Not run: 
##D ## Same with the old formula or dynformula interface
##D ## Arellano and Bond (1991), table 4, col. b 
##D z1 <- pgmm(log(emp) ~ log(wage) + log(capital) + log(output),
##D             lag.form = list(2,1,0,1), data = EmplUK, 
##D             effect = "twoways", model = "twosteps",
##D             gmm.inst = ~log(emp), lag.gmm = list(c(2,99)))
##D summary(z1, robust = FALSE)
##D 
##D ## Blundell and Bond (1998) table 4 (cf DPD for OX p. 12 col. 4)
##D z2 <- pgmm(dynformula(log(emp) ~ log(wage) + log(capital), list(1,1,1)), 
##D             data = EmplUK, effect = "twoways", model = "onestep", 
##D             gmm.inst = ~log(emp) + log(wage) + log(capital), 
##D             lag.gmm = c(2,99), transformation = "ld")
##D summary(z2, robust = TRUE)
## End(Not run)



