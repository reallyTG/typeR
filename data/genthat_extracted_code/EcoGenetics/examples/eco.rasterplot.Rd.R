library(EcoGenetics)


### Name: eco.rasterplot
### Title: Rasterplot graphs
### Aliases: eco.rasterplot

### ** Examples


 ## Not run: 
##D data(eco.test)
##D require(ggplot2)
##D 
##D # using the ecogen object "eco" to perform a multiple-lsa
##D con <- eco.weight(eco[["XY"]], method = "knearest", k = 4, row.sd = TRUE)
##D test.lsa <- eco.lsa(eco[["P"]], con = con, method = "I", nsim = 99, multi = "matrix")
##D 
##D # the plot method for this object based in ggplot2, is a resterplot
##D eco.plotLocal(test.lsa, multi = "ggplot2")
##D 
##D # adding a factor
##D test.lsa <- eco.lsa(eco[["P"]], con = con, method = "I",
##D nsim = 99, multi = "matrix", pop = eco[["S"]][,1])
##D eco.plotLocal(test.lsa, multi = "ggplot2")
##D 
##D # The generic rasterplot method requires a data matrix, and, as option, a condition 
##D # and a filter matrix. The condition is an expression, containing the word "filter" and 
##D # logical elements, e.g., "filter < 50", "filter <50 || filter > 2", etc. ). 
##D # Filter is used as a logical matrix (TRUE-FALSE, in relation to the passed condition),
##D # for filtering the data. If a condition is passed but not a filter matrix, the condition
##D # is applied over the data matrix, also using the word "filter". 
##D # Internally, the multi.lsa plot uses three fundamental elements. 
##D # - a data matrix: in the example, ecoslot.OBS(test.lsa)
##D # - a filter matrix: in the example, ecoslt.PVAL(test.lsa); i.e., 
##D # the data matrix will be filtered by P-value using the third element, an expresion.
##D # - an expression: in the example: "filter < 0.05"
##D  
##D  # by combining the three elements, the multivariate plot can be manually constructed:
##D  my.plot <- eco.rasterplot(x= ecoslot.OBS(test.lsa), 
##D  filter = ecoslot.PVAL(test.lsa), condition = "filter < 0.05")
##D  my.plot
##D  
##D  
##D  # add population
##D  my.plot <- eco.rasterplot(x= ecoslot.OBS(test.lsa), 
##D  filter = ecoslot.PVAL(test.lsa), 
##D  condition = "filter < 0.05", grp = ecoslot.POP(test.lsa))
##D  my.plot
##D  
##D  
##D  # extra manipulation with ggplot2 graphs (ggplot2 commands allowed by rasterplot)
##D  my.plot <- eco.rasterplot(x= ecoslot.OBS(test.lsa), 
##D  filter = ecoslot.PVAL(test.lsa), condition = "filter < 0.05",
##D  interactivePlot = FALSE)
##D  my.plot
##D  
##D  
##D  ## rotate plot
##D  
##D  my.plot + coord_flip()
##D  
##D  ## change design
##D  my.plot + theme_grey()
##D  
##D  
##D  # using the data as filter
##D  eco.rasterplot(x= ecoslot.OBS(test.lsa), filter = ecoslot.OBS(test.lsa), 
##D  condition = "filter > 0 & filter < 3")
##D  
##D  
##D  # example of bad syntax (incorrect use of && over matrices)
##D  eco.rasterplot(x= ecoslot.OBS(test.lsa), filter = ecoslot.OBS(test.lsa), 
##D  condition = "filter > 0 && filter < 3")
##D  
##D  
## End(Not run)
 



