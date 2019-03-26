library(qdap)


### Name: gantt
### Title: Gantt Durations
### Aliases: gantt plot_gantt_base
### Keywords: Gantt

### ** Examples

## Not run: 
##D (a <- gantt(DATA$state, DATA$person))  
##D plot(a)
##D plot(a, base = TRUE)
##D 
##D (b <- gantt(DATA$state, DATA$person, sums = TRUE)) 
##D plot(b)
##D plot(b, base = FALSE) 
##D 
##D (d <- gantt(DATA$state, list(DATA$sex, DATA$adult)))        
##D plot(d)
##D 
##D x <- gantt(mraja1$dialogue, mraja1$person) 
##D plot(x, base = TRUE)
##D plot(x, , base = TRUE, box.color = "black") 
##D 
##D z <- gantt(mraja1$dialogue, mraja1$sex)  
##D plot(z)  
##D                                                           
##D e <- with(mraja1, gantt(dialogue, list(fam.aff, sex, died), 
##D    units = "characters", sums = TRUE))
##D plot(e)  
##D      
##D f <- gantt(mraja1$dialogue, mraja1$person, units = "syllables",
##D     sums = TRUE)
##D plot(f, box.color = "red")
##D plot(f, base = FALSE)
##D 
##D dat <- gantt(mraja1$dialogue, list(mraja1$fam.aff, mraja1$sex),
##D     units = "sentences", col.sep = "_")
##D     
##D     
##D ## Animate It
##D ##=================
##D ani_gannt <- with(DATA.SPLIT, gantt(state, person))
##D Animate(ani_gannt)
##D Animate(plot(ani_gannt))
##D 
##D library(animation)
##D loc <- reports::folder(animation_gantt)
##D 
##D ## Set up the plotting function
##D oopt <- animation::ani.options(interval = 0.1)
##D 
##D FUN <- function() {
##D     out <- Animate(ani_gannt)
##D     lapply(out, function(x) {
##D         print(x)
##D         animation::ani.pause()
##D     })
##D 
##D }
##D 
##D type <- if(.Platform$OS.type == "windows") shell else system
##D saveGIF(FUN(), interval = 0.1, outdir = loc, cmd.fun = type)
## End(Not run)



