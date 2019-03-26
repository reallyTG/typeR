library(Gmisc)


### Name: figCapNo
### Title: Adds a figure caption number
### Aliases: figCapNo

### ** Examples

## Not run: 
##D ```{r, fig.cap=figCapNo("My nice plot")}
##D plot(1:10 + rnorm(10), 1:10)
##D ```
## End(Not run)
org_opts <- options(fig_caption_no = 2,
                    fig_caption_no_sprintf = "Figure %s: %s")
figCapNo("A plot with caption number = 3")

org_opts <- options(fig_caption_no = TRUE)
figCapNo("A plot with caption number =  1")

# Use default setting
options(fig_caption_no_sprintf = NULL)
figCapNo("A plot with caption number =  2")

# Return the original settings
options(org_opts)



