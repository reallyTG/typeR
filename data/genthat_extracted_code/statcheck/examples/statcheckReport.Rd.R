library(statcheck)


### Name: statcheckReport
### Title: Generate HTML report for statcheck output.
### Aliases: statcheckReport

### ** Examples
## Not run: 
##D   
##D   # first generate statcheck output, for instance by using the statcheck() function
##D   
##D   txt <- "blablabla the effect was very significant (t(100)=1, p < 0.001)"
##D   stat <- statcheck(txt)
##D   
##D   # next, use this output to generate a nice HTML report of the results
##D   
##D   statcheckReport(stat, outputFileName="statcheckHTMLReport", outputDir="C:/mydocuments/results")
##D   
## End(Not run)
  
  # you can now find your HTML report in the folder 
  # "C:/mydocuments/results" under the name "statcheckHTMLReport.html".
  



