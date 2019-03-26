library(Surrogate)


### Name: LongToWide
### Title: Reshapes a dataset from the 'long' format (i.e., multiple lines
###   per patient) into the 'wide' format (i.e., one line per patient)
### Aliases: LongToWide
### Keywords: Transpose dataset

### ** Examples

# Generate a dataset in the 'long' format that contains 
# S and T values for 100 patients
Outcome <- rep(x=c(0, 1), times=100)
ID <- rep(seq(1:100), each=2)
Treat <- rep(seq(c(0,1)), each=100)
Outcomes <- as.numeric(matrix(rnorm(1*200, mean=100, sd=10), 
                                      ncol=200))
Data <- data.frame(cbind(Outcome, ID, Treat, Outcomes))

# Reshapes the Data object 
LongToWide(Dataset=Data, OutcomeIndicator=Outcome, IdIndicator=ID, 
           TreatIndicator=Treat, OutcomeValue=Outcomes)



