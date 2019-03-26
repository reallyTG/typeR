library(BoutrosLab.plotting.general)


### Name: create.gif
### Title: Make a gif
### Aliases: create.gif

### ** Examples

## Not run: 
##D set.seed(223);
##D 
##D simple.data1 <- data.frame(
##D     x = sample(1:15, 10),
##D     y = LETTERS[1:10]
##D     );
##D 
##D simple.data2 <- data.frame(
##D     x = sample(1:15, 10),
##D     y = LETTERS[1:10]
##D     );
##D 
##D simple.data3 <- data.frame(
##D     x = sample(1:15, 10),
##D     y = LETTERS[1:10]
##D     );
##D 
##D p = list(
##D 	list(formula = x ~ y,data = simple.data1, yat = seq(0,16,2)),
##D 	list(formula = x ~ y,data = simple.data2, yat = seq(0,16,2)),
##D 	list(formula = x ~ y,data = simple.data3, yat = seq(0,16,2))
##D 	)
##D 
##D create.gif(
##D 	exec.func = create.barplot, 
##D 	parameters = p, 
##D 	number.of.frames = 3, 
##D 	delay = 20, 
##D 	filename = paste0(tempdir(),'/test.gif')
##D 	) 
## End(Not run)



