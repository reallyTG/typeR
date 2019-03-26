library(RGtk2Extras)


### Name: run.dialog
### Title: Simple Dialog Maker package for RGtk2
### Aliases: run.dialog
### Keywords: interface

### ** Examples

## Not run: 
##D  # A simple histogram plotting example:
##D   SimpleHistogram = function(N) hist(rnorm(N))
##D 
##D   SimpleHistogram.dialog = list(label = "A density-plotting histogram dialog",
##D    N.integerItem = 50, label = "Value of N")
##D 
##D   run.dialog(SimpleHistogram) 
##D  # end example
##D  
##D  # example 2
##D    # Function to plot a histogram, optionally adding a density plot with
##D    # adjustable bandwidth. If add.density is false, gray out the bandwidth range.
##D 
##D    # This is what's going on in the "signal" markup from the add.density widget:
##D      # We specify the "default" signal from the add.density trueFalseItem
##D      # Then specify the signal function, which takes the add.density 
##D      # trueFalseItem as its first argument and the bw.rangeItem 
##D      # as its second. In the function, we first of all
##D      # get the value of the trueFalseItem (which is TRUE or FALSE)
##D      # and call gtkWidgetSetSensitive on bw.widget with this value
##D      # (see the RGtk Help for gtkWidget)
##D      # The last element of the signal markup is the string "bw"
##D      # which run.dialog() replaces with the corresponding bw.rangeItem and
##D      # passes to the called signal function as its second argument.
##D 
##D   DensityHistogram = function(N, add.density, bw=NULL)
##D   {
##D      x <- rnorm(N)
##D      hist(x, probability=add.density)
##D      if(add.density) points(density(x, bw=bw), type = "l")
##D   }
##D 
##D   DensityHistogram.dialog = list(
##D    #keep.open = TRUE, # uncomment to keep the dialog open
##D    label = "A density-plotting histogram dialog",
##D    N.integerItem = c(value=100, from=10, to=1000, by=10), label = "Value of X",
##D    add.density.trueFalseItem = FALSE, label = "Add Density Plot?",
##D      signal = c("default", 
##D        function(item, bw.widget) bw.widget$setSensitive(get.value(item)), "bw"),
##D     # signal = c("default", "toggle.sensitive", "bw"), # using the built-in
##D    bw.rangeItem = c(value=0.3, from=0, to=2, by=0.05), label = "Bandwidth")
##D 
##D   run.dialog(DensityHistogram)
##D   # end example 2
##D   
##D     # Angle display demo, from Graham Williams
##D   demo(MakeAngle)
##D   
##D     # Cancel dialog demo
##D   demo(ProgressBar)
##D 
## End(Not run)




