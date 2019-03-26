library(Momocs)


### Name: plot_PCA
### Title: Multivariate plots using grindr layers
### Aliases: plot_PCA

### ** Examples

### First prepare two PCA objects.

# Some outlines with bot
bp <- bot %>% mutate(fake=sample(letters[1:5], 40, replace=TRUE)) %>%
efourier(6) %>% PCA
plot_PCA(bp)
plot_PCA(bp, ~type)
plot_PCA(bp, ~fake)

# Some curves with olea
op <- olea %>%
mutate(s=coo_area(.)) %>%
filter(var != "Cypre") %>%
chop(~view) %>% lapply(opoly, 5, nb.pts=90) %>%
combine %>% PCA
op$fac$s %<>% as.character() %>% as.numeric()

op %>% plot_PCA

### Now we can play with layers
# and for instance build a custom plot
# it should start with plot_PCA()

my_plot <- function(x, ...){

x %>%
    plot_PCA(...) %>%
    layer_points %>%
    layer_ellipsesaxes %>%
    layer_rug
}

# and even continue after this function
op %>% my_plot(~var, axes=c(1, 3)) %>%
    layer_title("hi there!") %>%
    layer_stars()

# You get the idea.



