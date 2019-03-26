library(sra)


### Name: 2. Phenomenological models
### Title: Descriptive models of artificial-selection responses:
###   auto-regressive models
### Aliases: sraAutoreg sraAutoregLog sraAutoregHerit sraAutoregEvolv
### Keywords: models nonlinear ts

### ** Examples

# Making the example reproducible
########### Generating a dummy dataset ################

m <- c(12,11,12,14,18,17,19,22,20,19)
v <- c(53,47,97,155,150,102,65,144,179,126)
s <- c(15,14,14,17,21,20,22,25,24,NA)
n <- c(100,80,120,60,100,90,110,80,60,100)

########## Making a sra data set #######################
data <- sraData(phen.mean=m, phen.var=v, phen.sel=s, N=n)

#################### Data Analysis ####################

# Autoregressive models
autor <- sraAutoreg(data)

# Details of the model:
AIC(autor)
coef(autor)
plot(autor)
plot(autor, var=TRUE)

# Alternative scales
autor.log <- sraAutoregLog(data)
autor.herit <- sraAutoregHerit(data)
autor.evolv <- sraAutoregEvolv(data)

## No test: 
# Changes in the complexity of the model:
autor0 <- sraAutoreg(data, active=c(TRUE,TRUE,FALSE,FALSE))
                         
# In case of convergence issues
autor1 <- sraAutoreg(data, active=c(TRUE,TRUE,TRUE,TRUE), rep=2, rand=0.1)
## End(No test)



