library(qdapRegex)


### Name: rm_citation
### Title: Remove/Replace/Extract Citations
### Aliases: rm_citation ex_citation as_count
### Keywords: citation

### ** Examples

## All Citations
x <- c("Hello World (V. Raptor, 1986) bye",
    "Narcissism is not dead (Rinker, 2014)",
    "The R Core Team (2014) has many members.",
    paste("Bunn (2005) said, \"As for elegance, R is refined, tasteful, and",
        "beautiful. When I grow up, I want to marry R.\""),
    "It is wrong to blame ANY tool for our own shortcomings (Baer, 2005).",
    "Wickham's (in press) Tidy Data should be out soon.",
    "Rinker's (n.d.) dissertation not so much.",
    "I always consult xkcd comics for guidance (Foo, 2012; Bar, 2014).",
    "Uwe Ligges (2007) says, \"RAM is cheap and thinking hurts\""
)

rm_citation(x)
ex_citation(x)
as_count(ex_citation(x))
rm_citation(x, replacement="[CITATION HERE]")
## Not run: 
##D qdapTools::vect2df(sort(table(unlist(rm_citation(x, extract=TRUE)))), 
##D     "citation", "count")
## End(Not run)

## In-Text
ex_citation(x, pattern="@rm_citation2")

## Parenthetical
ex_citation(x, pattern="@rm_citation3")

## Not run: 
##D ## Mining Citation
##D if (!require("pacman")) install.packages("pacman")
##D pacman::p_load(qdap, qdapTools, dplyr, ggplot2)
##D 
##D url_dl("http://umlreading.weebly.com/uploads/2/5/2/5/25253346/whole_language_timeline-updated.docx")
##D 
##D parts <- read_docx("whole_language_timeline-updated.docx") %>%
##D     rm_non_ascii() %>%
##D     split_vector(split = "References", include = TRUE, regex=TRUE)
##D     
##D parts[[1]]
##D 
##D parts[[1]] %>%
##D     unbag() %>%
##D     ex_citation() %>%
##D     c()
##D 
##D ## Counts
##D parts[[1]] %>%
##D     unbag() %>%
##D     ex_citation() %>%
##D     as_count()
##D     
##D 
##D ## By line
##D ex_citation(parts[[1]])
##D 
##D ## Frequency
##D cites <- parts[[1]] %>%
##D     unbag() %>%
##D     ex_citation() %>%
##D     c() %>%
##D     data_frame(citation=.) %>%
##D     count(citation) %>%
##D     arrange(n) %>%
##D     mutate(citation=factor(citation, levels=citation))
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



