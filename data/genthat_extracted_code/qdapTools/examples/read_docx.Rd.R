library(qdapTools)


### Name: read_docx
### Title: Read in .docx Content
### Aliases: read_docx
### Keywords: docx

### ** Examples

## Not run: 
##D ## Mining Citation
##D url_dl("http://umlreading.weebly.com/uploads/2/5/2/5/25253346/whole_language_timeline-updated.docx")
##D 
##D (txt <- read_docx("whole_language_timeline-updated.docx"))
##D 
##D library(qdapTools); library(ggplot2); library(qdap)
##D txt <- rm_non_ascii(txt)
##D 
##D parts <- split_vector(txt, split = "References", include = TRUE, regex=TRUE)
##D 
##D parts[[1]]
##D 
##D rm_citation(unbag(parts[[1]]), extract=TRUE)[[1]]
##D 
##D ## By line
##D rm_citation(parts[[1]], extract=TRUE)
##D 
##D ## Frequency
##D left_just(cites <- list2df(sort(table(rm_citation(unbag(parts[[1]]),
##D     extract=TRUE)), T), "freq", "citation")[2:1])
##D 
##D ## Distribution of citations (find locations and then plot)
##D cite_locs <- do.call(rbind, lapply(cites[[1]], function(x){
##D     m <- gregexpr(x, unbag(parts[[1]]), fixed=TRUE)
##D     data.frame(
##D         citation=x,
##D         start = m[[1]] -5,
##D         end =  m[[1]] + 5 + attributes(m[[1]])[["match.length"]]
##D     )
##D }))
##D 
##D ggplot(cite_locs) +
##D     geom_segment(aes(x=start, xend=end, y=citation, yend=citation), size=3,
##D         color="yellow") +
##D     xlab("Duration") +
##D     scale_x_continuous(expand = c(0,0),
##D         limits = c(0, nchar(unbag(parts[[1]])) + 25)) +
##D     theme_grey() +
##D     theme(
##D         panel.grid.major=element_line(color="grey20"),
##D         panel.grid.minor=element_line(color="grey20"),
##D         plot.background = element_rect(fill="black"),
##D         panel.background = element_rect(fill="black"),
##D         panel.border = element_rect(colour = "grey50", fill=NA, size=1),
##D         axis.text=element_text(color="grey50"),    
##D         axis.title=element_text(color="grey50")  
##D     )
## End(Not run)



