library(rAmCharts)


### Name: amBullet
### Title: Plotting bullet chart using rAmCharts
### Aliases: amBullet

### ** Examples

amBullet(value = 65)

## No test: 
# Other examples available which can be time consuming depending on your configuration.

# Remove steps for background
amBullet(value = 65, steps = FALSE)

# Tune the colors with name or HTML code
amBullet(value = 65, val_color = "purple", limit_color = "#3c8dbc")

# Change the orientation
amBullet(value = 65, steps = FALSE, horiz = FALSE)

# Add text
amBullet(value = 65, label = "Evaluation")

# Change min and max values
amBullet(value = 65, min = 20, max = 90)
## End(No test)





