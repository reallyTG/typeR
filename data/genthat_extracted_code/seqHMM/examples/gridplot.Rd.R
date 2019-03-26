library(seqHMM)


### Name: gridplot
### Title: Plot Multidimensional Sequence Plots in a Grid
### Aliases: gridplot

### ** Examples

## Not run: 
##D data("biofam3c")
##D 
##D # Creating sequence objects
##D child_seq <- seqdef(biofam3c$children, start = 15)
##D marr_seq <- seqdef(biofam3c$married, start = 15)
##D left_seq <- seqdef(biofam3c$left, start = 15)
##D 
##D ## Choosing colors
##D attr(child_seq, "cpal") <- c("#66C2A5", "#FC8D62")
##D attr(marr_seq, "cpal") <- c("#AB82FF", "#E6AB02", "#E7298A")
##D attr(left_seq, "cpal") <- c("#A6CEE3", "#E31A1C")
##D 
##D 
##D # Preparing plot for state distribution plots of observations for women
##D ssp_f <- ssp(
##D   list(child_seq[biofam3c$covariates$sex == "woman",],
##D        marr_seq[biofam3c$covariates$sex == "woman",],
##D        left_seq[biofam3c$covariates$sex == "woman",]),
##D   type = "d", plots = "obs", title = "Women",
##D   ylab = c("Children", "Married", "Left home"))
##D 
##D # Preparing plot for state distribution plots of observations for men
##D # (Updating the previous plot, only arguments that change values)
##D ssp_m <- update(ssp_f, title = "Men",
##D   x = list(child_seq[biofam3c$covariates$sex == "man",],
##D        marr_seq[biofam3c$covariates$sex == "man",],
##D        left_seq[biofam3c$covariates$sex == "man",]))
##D 
##D # Plotting state distribution plots of observations for women and men in two columns
##D gridplot(list(ssp_f, ssp_m), ncol = 2, with.legend = FALSE)
##D 
##D # Preparing plots for women's state distributions
##D ssp_f2 <- ssp(
##D   list(marr_seq[biofam3c$covariates$sex == "woman",],
##D        child_seq[biofam3c$covariates$sex == "woman",],
##D        left_seq[biofam3c$covariates$sex == "woman",]),
##D   type = "d", border = NA, with.legend = FALSE,
##D   title = "State distributions for women", title.n = FALSE, xtlab = 15:30,
##D   ylab.pos = c(1, 2, 1), ylab = c("Married", "Children", "Left home"))
##D 
##D # The same plot with sequences instead of state distributions
##D ssp_f3 <- update(
##D   ssp_f2, type = "I", sortv = "mds.obs", title = "Sequences for women")
##D 
##D # State distributions with men's data
##D ssp_m2 <- update(
##D   ssp_f2, title = "State distributions for men",
##D   x = list(marr_seq[biofam3c$covariates$sex == "man",],
##D            child_seq[biofam3c$covariates$sex == "man",],
##D            left_seq[biofam3c$covariates$sex == "man",]))
##D 
##D # Men's sequences
##D ssp_m3 <- update(
##D   ssp_m2, type = "I", sortv = "mds.obs", title = "Sequences for men")
##D 
##D # Plotting state distributions and index plots of observations
##D # for women and men in two columns (+ one column for legends)
##D gridplot(
##D   list(ssp_f2, ssp_f3, ssp_m2, ssp_m3), ncol = 3, byrow = TRUE,
##D   with.legend = "combined", legend.pos = "right", col.prop = c(0.35, 0.35, 0.3))
##D 
##D # The same with different positioning and fixed cells for legends
##D gridplot(
##D   list(ssp_f2, ssp_f3, ssp_m2, ssp_m3), ncol = 2, nrow = 3, byrow = TRUE,
##D   # defining the legend positions by the cell numbers
##D   legend.pos = 3:4)
##D  
## End(Not run)




