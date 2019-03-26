library(lazyWeave)


### Name: write.univ
### Title: Write Univariate Table to a File
### Aliases: write.univ

### ** Examples

#output will be written to the working directory
getwd()

#write.univ function must be written to either a LaTeX
#or HTML file.  HTML format is through the lazyHTML package.
options(lazyReportFormat="html")

#Delivery dataset from CCFmisc library
data(Delivery)

#label the variables that will be used
Delivery$maternal.age <- 
  labelVector::set_label(Delivery$maternal.age, "Maternal Age")
Delivery$ga.weeks <- 
  labelVector::set_label(Delivery$ga.weeks, "Gestation weeks")
Delivery$wt.gram <- 
  labelVector::set_label(Delivery$wt.gram, "Weight (g)")

#summaries of the continuous variables
#maternal.age, ga.weeks and wt.gram in the 
#Delivery dataset.
deliv.uni <- univ(Delivery,
                  vars=c("maternal.age", "ga.weeks", "wt.gram")
)

#summaries of continuous variables
#by level of delivery.type
delivBy.uni <- univ(Delivery,
                    vars=c("maternal.age", "ga.weeks", "wt.gram"),
                    byVar="delivery.type"
)

#to write univ based table to an HTML file enclose the
#write.univ() in the html_write function as below.
#see documentation for other options.

#To print byVariable group names in the table, 
#set the Group=T flag in the write.univ() function.

## Not run: 
##D lazy.write(
##D     lazy.file.start(),
##D     write.univ(deliv.uni),
##D     write.univ(delivBy.uni, Group=TRUE),
##D     lazy.file.end(),
##D     OutFile="ExampleFile.html"
##D   )
##D   
##D   unlink("ExampleFile.html")
## End(Not run)




