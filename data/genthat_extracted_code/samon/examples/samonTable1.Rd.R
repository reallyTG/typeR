library(samon)


### Name: samonTable1
### Title: Summarizes two treatment groups.
### Aliases: samonTable1 samonTabmat1

### ** Examples

 # monotone missing
 data("samonPANSS1")
 samonTable1( samonTabmat1( samonPANSS1 ), trtlab = "PANSS Placebo" )

 # non monotone missing
 data("VAS1")
 samonTable1( samonTabmat1( VAS1 ), trtlab = "VAS Placebo" )



