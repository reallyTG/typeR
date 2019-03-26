library(phylosim)


### Name: CodonSequence
### Title: The CodonSequence class
### Aliases: CodonSequence

### ** Examples

       # create an empty CodonSequence object
       s<-CodonSequence(length=50)
       s
       # set states
       s$states<-c("ATG","CGA","TTT","CTA")
       s
       # create a sequence object by specifying a string
       s<-CodonSequence(string="ATCTTTCGAATG")
       s
 


