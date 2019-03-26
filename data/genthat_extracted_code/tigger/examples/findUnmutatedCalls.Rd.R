library(tigger)


### Name: findUnmutatedCalls
### Title: Determine which calls represent an unmutated allele
### Aliases: findUnmutatedCalls

### ** Examples

# Find which of the sample alleles are unmutated
calls <- findUnmutatedCalls(SampleDb$V_CALL, SampleDb$SEQUENCE_IMGT, 
         germline_db=GermlineIGHV)




