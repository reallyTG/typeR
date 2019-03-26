library(dexterMST)


### Name: design_plot
### Title: Plot the routing design of mst tests
### Aliases: design_plot

### ** Examples

## Not run: 
##D # plot test designs for all tests in the project
##D design_plot(db)
##D 
##D # plot design for a test with id 'math'
##D design_plot(db, test_id == 'math')
##D 
##D # plot design for test math with item 'circumference' turned off
##D # (this plot will only work if you have response data)
##D design_plot(db, test_id == 'math' & item_id != 'circumference')
##D 
## End(Not run)




