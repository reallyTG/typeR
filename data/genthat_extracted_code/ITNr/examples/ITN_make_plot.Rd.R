library(ITNr)


### Name: ITN_make_plot
### Title: Single Clean ITN Plot
### Aliases: ITN_make_plot

### ** Examples

## No test: 
##Load graph
data("ELEnet16")

##Otherwise download data from WITS and create an
##International Trade Network using WITSclean()

##Plot the network - No Label, colour by region
ITN_plot_example<-ITN_make_plot(ELEnet16,FALSE,TRUE)
## End(No test)



