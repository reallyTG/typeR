library(XLConnect)


### Name: addImage-methods
### Title: Adding images to a worksheet
### Aliases: addImage addImage-methods addImage,workbook-method
### Keywords: methods utilities

### ** Examples

## Write an R plot to a specified named region
## This example makes use of the 'Tonga Trench Earthquakes' example

# Load workbook (create if not existing)
wb <- loadWorkbook("earthquake.xlsx", create = TRUE)

# Create a sheet named 'earthquake'
createSheet(wb, name = "earthquake")

# Create a named region called 'earthquake' referring to the sheet
# called 'earthquake' 
createName(wb, name = "earthquake", formula = "earthquake!$B$2")

# Create R plot to a png device
require(lattice)
png(filename = "earthquake.png", width = 800, height = 600)
devAskNewPage(ask = FALSE)

Depth <- equal.count(quakes$depth, number=8, overlap=.1)
xyplot(lat ~ long | Depth, data = quakes)
update(trellis.last.object(),
       strip = strip.custom(strip.names = TRUE, strip.levels = TRUE),
       par.strip.text = list(cex = 0.75),
       aspect = "iso")

dev.off()

# Write image to the named region created above using the image's
# original size; i.e. the image's top left corner will match the
# specified cell's top left corner 
addImage(wb, filename = "earthquake.png", name = "earthquake",
         originalSize = TRUE)

# Save workbook (this actually writes the file to disk)
saveWorkbook(wb)



