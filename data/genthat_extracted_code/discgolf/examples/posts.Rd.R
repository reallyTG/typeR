library(discgolf)


### Name: posts
### Title: Work with posts
### Aliases: posts post_get post_create post_wikify

### ** Examples

## Not run: 
##D # get a post
##D post_get(90)
##D post_get(120)
##D post_get(130)
##D post_get(155)
##D cat(post_get(155)$raw)
##D 
##D # create post, create topic first
##D z <- topic_create("The problems with blue skies",
##D   text = "just saying these things cause I like the sky very much")
##D zz <- post_create(topic_id = z$topic_id,
##D   text = "There isn't a problem is there?")
##D topic(z$topic_id)
##D post_get(zz$id)
##D 
##D # Wikify a post
##D post_wikify(zz$id)
##D 
##D # cleanup - delete the topic
##D topic_delete(z$topic_id)
## End(Not run)



