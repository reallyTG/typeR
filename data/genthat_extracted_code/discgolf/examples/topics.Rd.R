library(discgolf)


### Name: topics
### Title: Work with topics
### Aliases: topics topics_latest topics_new topics_by topic topic_create
###   topic_delete topic_rename

### ** Examples

## Not run: 
##D topics_latest()
##D topics_new()
##D topics_by("cboettig")
##D topic(8)
##D 
##D topics_latest(verbose = TRUE)
##D 
##D # Create topic
##D ## simple
##D topic_create(title="testing from discgolf - 10", text="testing from discgolf, hello world!
##D hopefully this works")
##D 
##D ## more complicated
##D text <- '
##D ## this time with markdown
##D 
##D ```r
##D print("hello world")
##D #> [1] "hello world"
##D ```
##D 
##D ```r
##D head(mtcars)
##D #>                    mpg cyl disp  hp drat    wt  qsec vs am gear carb
##D #> Mazda RX4         21.0   6  160 110 3.90 2.620 16.46  0  1    4    4
##D #> Mazda RX4 Wag     21.0   6  160 110 3.90 2.875 17.02  0  1    4    4
##D #> Datsun 710        22.8   4  108  93 3.85 2.320 18.61  1  1    4    1
##D #> Hornet 4 Drive    21.4   6  258 110 3.08 3.215 19.44  1  0    3    1
##D #> Hornet Sportabout 18.7   8  360 175 3.15 3.440 17.02  0  0    3    2
##D #> Valiant           18.1   6  225 105 2.76 3.460 20.22  1  0    3    1
##D ```
##D '
##D topic_create(title="testing from discgolf - 23", text=text)
##D 
##D # delete a topic
##D topic_delete(242)
##D 
##D 
##D # rename a topic - DOESN'T WORK YET
##D ## create a topic
##D # res <- topic_create(title = "testing from discgolf - 5",
##D #    text = "testing from discgolf, again")
##D ## rename
##D # res$topic_slug
##D # topic_rename(res$topic_id, title = "new title")
##D # topic(res$topic_id)$title
##D ## cleanup
##D # topic_delete(res$topic_id)
## End(Not run)



