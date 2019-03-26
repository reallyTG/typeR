library(poppr)


### Name: win.ia
### Title: Calculate windows of the index of association for genlight
###   objects.
### Aliases: win.ia

### ** Examples


# with structured snps assuming 1e4 positions
set.seed(999)
x <- glSim(n.ind = 10, n.snp.nonstruc = 5e2, n.snp.struc = 5e2, ploidy = 2)
position(x) <- sort(sample(1e4, 1e3))
res <- win.ia(x, window = 300L) # Calculate for windows of size 300
plot(res, type = "l")

## Not run: 
##D 
##D # unstructured snps
##D set.seed(999)
##D x <- glSim(n.ind = 10, n.snp.nonstruc = 1e3, ploidy = 2)
##D position(x) <- sort(sample(1e4, 1e3))
##D res <- win.ia(x, window = 300L) # Calculate for windows of size 300
##D plot(res, type = "l")
##D 
##D # Accounting for chromosome coordinates
##D set.seed(999)
##D x <- glSim(n.ind = 10, n.snp.nonstruc = 5e2, n.snp.struc = 5e2, ploidy = 2)
##D position(x) <- as.vector(vapply(1:10, function(x) sort(sample(1e3, 100)), integer(100)))
##D chromosome(x) <- rep(1:10, each = 100)
##D res <- win.ia(x, window = 100L)
##D plot(res, type = "l")
##D 
##D # Converting chromosomal coordinates to tidy data
##D library("dplyr")
##D library("tidyr")
##D res_tidy <- res %>% 
##D   data_frame(rd = ., chromosome = names(.)) %>% # create two column data frame
##D   separate(chromosome, into = c("chromosome", "position")) %>% # get the position info
##D   mutate(position = as.integer(position)) %>% # force position as integers
##D   mutate(chromosome = factor(chromosome, unique(chromosome))) # force order chromosomes
##D res_tidy
##D 
##D # Plotting with ggplot2
##D library("ggplot2")
##D ggplot(res_tidy, aes(x = position, y = rd, color = chromosome)) +
##D   geom_line() +
##D   facet_wrap(~chromosome, nrow = 1) +
##D   ylab(expression(bar(r)[d])) +
##D   xlab("terminal position of sliding window") +
##D   labs(caption = "window size: 100bp") + 
##D   theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5)) +
##D   theme(legend.position = "top")
##D 
## End(Not run)




