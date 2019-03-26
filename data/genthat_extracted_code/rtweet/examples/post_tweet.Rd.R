library(rtweet)


### Name: post_tweet
### Title: Posts status update to user's Twitter account
### Aliases: post_tweet post_status

### ** Examples

## Not run: 
##D ## generate data to make/save plot (as a .png file)
##D x <- rnorm(300)
##D y <- x + rnorm(300, 0, .75)
##D col <- c(rep("#002244aa", 50), rep("#440000aa", 50))
##D bg <- c(rep("#6699ffaa", 50), rep("#dd6666aa", 50))
##D 
##D ## crate temporary file name
##D tmp <- tempfile(fileext = ".png")
##D 
##D ## save as png
##D png(tmp, 6, 6, "in", res = 127.5)
##D par(tcl = -.15, family = "Inconsolata",
##D     font.main = 2, bty = "n", xaxt = "l", yaxt = "l",
##D     bg = "#f0f0f0", mar = c(3, 3, 2, 1.5))
##D plot(x, y, xlab = NULL, ylab = NULL, pch = 21, cex = 1,
##D      bg = bg, col = col,
##D      main = "This image was uploaded by rtweet")
##D grid(8, lwd = .15, lty = 2, col = "#00000088")
##D dev.off()
##D 
##D ## post tweet with media attachment
##D post_tweet("a tweet with media attachment", media = tmp)
##D 
##D # example of replying within a thread
##D ## first post
##D post_tweet(status="first in a thread")
##D 
##D ## lookup status_id
##D my_timeline <- get_timeline(rtweet:::home_user())
##D 
##D ## ID for reply
##D reply_id <- my_timeline$status_id[1]
##D 
##D ## post reply
##D post_tweet("second in the thread",
##D   in_reply_to_status_id = reply_id)
## End(Not run)



