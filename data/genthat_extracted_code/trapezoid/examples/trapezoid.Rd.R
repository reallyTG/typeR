library(trapezoid)


### Name: trapezoid
### Title: The Trapezoidal Distribution
### Aliases: Trapezoid trapezoid dtrapezoid ptrapezoid qtrapezoid
###   rtrapezoid
### Keywords: distribution

### ** Examples

	## Plot default trapezoid distribution
	curve(dtrapezoid(x, min = 0, mode1 = 1/3, mode2 = 2/3, max = 1, 
	  n1 = 2, n3 = 2, alpha = 1), from = 0, to = 1)
	
	
	## Plot triangular trapezoid distribution
	curve(dtrapezoid(x, min = 0, mode1 = 1/2, mode2 = 1/2, max = 1, 
	  n1 = 2, n3 = 2, alpha = 1), from = 0, to = 1)
	
	
	## Explore effects of n1, n3, and alpha parameters
	# plyr and ggplot2 are required for this example
	require(plyr)
	require(ggplot2)
	
	x <- seq(from = 0, to = 1, by = 0.01)	
	
	# Create a list of arguments, varying n1, n3, and alpha
	arguments <- list()
	arguments[['A']] <- list(x = x, n1 = 2, n3 = 2, alpha = 0.8)
	arguments[['B']] <- list(x = x, n1 = 1.5, n3 = 1.5, alpha = 1)
	arguments[['C']] <- list(x = x, n1 = 2.5, n3 = 2.5, alpha = 1.5)
	arguments[['D']] <- list(x = x, n1 = 1.5, n3 = 2.5, alpha = 0.5)
	arguments[['E']] <- list(x = x, n1 = 2.5, n3 = 1.5, alpha = 1)
	arguments[['F']] <- list(x = x, n1 = 0.5, n3 = 0.5, alpha = 1.5)
	arguments[['G']] <- list(x = x, n1 = 1.5, n3 = 0.5, alpha = 0.5)
	arguments[['H']] <- list(x = x, n1 = 2.5, n3 = 0.5, alpha = 1)
	arguments[['I']] <- list(x = x, n1 = 0.5, n3 = 1.5, alpha = 1.5)
	arguments[['J']] <- list(x = x, n1 = 0.5, n3 = 2.5, alpha = 0.5)
	
	# Calculate the distributions
	plot.data <- ldply(arguments, function(z)
	{
	  x <- z$x
	  density <- dtrapezoid(x = z$x, min = 0, mode1 = 0.2, mode2 = 0.8,
	    max = 1, n1 = z$n1, n3 = z$n3, alpha = z$alpha)
	  args <- paste("n1 = ", z$n1, ", n3 = ", z$n3, ", alpha = ", z$alpha, 
	    sep="", collapse="")
	  out <- data.frame(x, density, args)
	})
	
	# Create labels for later use in displaying the arguments on the plots 
	plot.data$label <- paste(plot.data$.id, ": ", plot.data$args, sep="")
	
	# Create plots
	generalizedTrapezoids <- ggplot(data = plot.data, aes(x = x, y = density)) + 
	  geom_line() + theme_bw() + 
	  facet_wrap(~label, ncol = 2, scales = "free_y")
	print(generalizedTrapezoids)



