library(metaDigitise)


### Name: getExtracted
### Title: getExtracted
### Aliases: getExtracted

### ** Examples

## No test: 
# Make some mock metaDigitise object
	mock_metaDig <- list(
			image_file = "./image.png",
			flip=FALSE,
			rotate=0,
			plot_type="mean_error",
			variable="y",
			calpoints = data.frame(x=c(0,0),y=c(0,100)), 
			point_vals = c(1,2), 
			entered_N=TRUE,
			raw_data = data.frame(id=rep("control",2), 
						x=c(60,60), 
						y=c(75,50), 
						n=rep(20,2)),
						knownN = NULL,
						error_type="sd",
					processed_data=data.frame(
						id=as.factor("control"),
						mean=1.5, 
						error=0.25, 
						n=20, 	
						variable="y", 
						stringsAsFactors = FALSE)	
					)
class(mock_metaDig) <- 'metaDigitise'

# write image file to tmpdir()
		dir <- tempdir()

# Setup directory as it would be if digitised images existed		
		setup_calibration_dir(dir)

# Save the digitised data
		saveRDS(mock_metaDig, file = paste0(dir, "/caldat/", "image"))

#metaDigitise figures
data <- getExtracted(dir)
## End(No test)



