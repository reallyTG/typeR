library(rphylopic)


### Name: image
### Title: Perform actions with images.
### Aliases: image image_get image_list image_timerange image_count
###   image_data

### ** Examples

## Not run: 
##D # Get info on an image
##D uuid <- "9fae30cd-fb59-4a81-a39c-e1826a35f612"
##D image_get(uuid = uuid)
##D image_get(uuid = uuid, options=c('credit','pngFiles','taxa','canonicalName','string','uri','type'))
##D image_get(uuid = uuid, options=c('credit','licenseURL','pngFiles','submitted','submitter',
##D    'svgFile','taxa','canonicalName','string','uri','type','citationStart'))
##D 
##D # Count images in Phylopic database
##D image_count()
##D image_count(verbose = TRUE)
##D 
##D # Lists images in chronological order, from most to least recently modified
##D image_list(start=1, length=10)
##D image_list(start=1, length=10, options="taxa")
##D 
##D # Lists images within a given time range, from most to least recent
##D image_timerange(from="2013-05-11")
##D image_timerange(from="2013-05-11", to="2013-05-12")
##D image_timerange(from="2013-05-11", to="2013-05-12", options='credit')
##D 
##D # Get data for an image
##D ## input uuids
##D toget <- c("c089caae-43ef-4e4e-bf26-973dd4cb65c5", "41b127f6-0824-4594-a941-5ff571f32378", 
##D    "9c6af553-390c-4bdd-baeb-6992cbc540b1")
##D image_data(toget, size = "64")
##D image_data(toget, size = "thumb")
##D 
##D ## input the output from search_images
##D x <- search_text(text = "Homo sapiens", options = "names")
##D output <- search_images(x[1:10], options=c("pngFiles", "credit", "canonicalName"))
##D image_data(output, size = "64")
##D 
##D ## Put a silhouette behind a plot
##D library('ggplot2')
##D img <- image_data("27356f15-3cf8-47e8-ab41-71c6260b2724", size = "512")[[1]]
##D qplot(x=Sepal.Length, y=Sepal.Width, data=iris, geom="point") + add_phylopic(img)
##D 
##D ## Use as points in a ggplot plot
##D library('ggplot2')
##D uuid <- "c089caae-43ef-4e4e-bf26-973dd4cb65c5"
##D img <- image_data(uuid, size = "64")[[1]]
##D (p <- ggplot(mtcars, aes(drat, wt)) + geom_blank())
##D for(i in 1:nrow(mtcars)) p <- p + add_phylopic(img, 1, mtcars$drat[i], mtcars$wt[i], ysize = 0.3)
##D p
## End(Not run)



