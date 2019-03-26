library(DySeq)


### Name: Basic_Markov_as_APIM
### Title: Basic_Markov_as_APIM
### Aliases: Basic_Markov_as_APIM

### ** Examples

## Not run: 
##D # Simulating example-data:
##D trans1<-APIMtoTrans(B0_1=0, AE_1=1, PE_1=0, Int_1=0,
##D                    B0_2=0, AE_2=0, PE_2=0, Int_2=0)
##D 
##D x<-simSeqSample(trans=trans1, initial=rep(.25,4), length=100, N=100)
##D 
##D # Running the function, 
##D # small boot-size sample only for demonstration purposes! 
##D Basic_Markov_as_APIM(x, 1:100, 101:200, boot=10)
## End(Not run)



