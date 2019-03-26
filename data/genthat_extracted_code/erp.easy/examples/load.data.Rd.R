library(erp.easy)


### Name: load.data
### Title: Import your ERP data files.
### Aliases: load.data

### ** Examples

## Not run: 
##D # Importing data for a condition named "Neutral" (file names: "Sub1_Neutral.txt",
##D "Sub2_Neutral.txt", etc.)
##D neutral <- load.data(path = "/Users/Username/Folder/", condition = "Neutral",
##D num.subs = 20, epoch.st = -200, epoch.end = 899, header = FALSE)
##D 
##D # Adding imported data named "positive" to the imported "neutral" data
##D combo <- rbind.data.frame(neutral, positive)
## End(Not run)



