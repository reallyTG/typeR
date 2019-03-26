library(episplineDensity)


### Name: expepi
### Title: Fit density estimate by exponential epi-splines.
### Aliases: expepi

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

n10 <- c(-0.795173769, -0.268865287, -0.032803042, -0.361751212, 
0.699170399, -0.909275685, 0.452956532, 1.501356616, 1.669061521, 
-0.524919503)
#
# Generate a unimodal estimate. Plot automatically.
#
## Not run: soft <- setup.softinfo (10, unimodal = TRUE)

## Not run: expepi (n10, softinfo = soft)
#
# Generate a unimodal estimate, but constrain the second non-central
# moment to be <= 0.4. Plot automatically. This command will require
# a couple of minutes to run.
#
## Not run: soft$upperbound2moment <- 0.4
## Not run: expepi (n10, softinfo = soft)
#
# Generate a nondecreasing estimate without plotting.
#
## Not run: soft <- setup.softinfo (10, monotone="nondecreasing")
## Not run: 
##D n10.out <- expepi (n10, softinfo = soft, postproc.controls = 
##D  postproc.control (pic.types = NULL))
## End(Not run)
#
# Now plot.
#
## Not run: plot (n10.out)



