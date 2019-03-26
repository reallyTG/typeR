library(htm2txt)


### Name: htm2txt
### Title: Convert a html document to simple plain texts by removing all
###   html tags
### Aliases: htm2txt

### ** Examples

text = htm2txt("<html><body>html texts</body></html>")
text = htm2txt(c("Hello<p>World", "Goodbye<br>Friends"))
text = htm2txt("<p>Menu:</p><ul></li>Coffee</li><li>Tea</li></ul>", list = "\n- ")
text = htm2txt("Page 1<hr>Page 2", pagebreak = "\n\n[NEW PAGE]\n\n")



