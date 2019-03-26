library(GxM)


### Name: checkGxM
### Title: Singularity Check for GxM Model Fittings
### Aliases: checkGxM

### ** Examples

id <- 1:10;
rG <- c(rep(1,5),rep(0.5,5));
M1 <- rnorm(10);
M2 <- rnorm(10);
P1 <- rnorm(10);
P2 <- rnorm(10);
Data <- data.frame(id,rG,M1,M2,P1,P2);
output <- GxM(dataset = Data, modelname='Chol', closedform=TRUE);
checkGxM(output, dataset=Data);



