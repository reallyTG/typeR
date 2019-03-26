library(memisc)


### Name: html
### Title: Building Blocks for HTML Code
### Aliases: html print.html_elem as.character.html_elem c.html_elem
###   html_group as.html_group as.character.html_group print.html_group
###   [.html_group [<-.html_group c.html_group content content<- setContent
###   attribs attribs<- setAttribs setAttribs.character
###   setAttribs.html_elem setAttribs.html_group [<-.html_attributes css
###   as.css style style<- setStyle setStyle.character setStyle.html_elem
###   setStyle.html_group as.character.css print.css [<-.css

### ** Examples


html("img")
html("img",src="test.png")
html("div",class="element",id="first","Sisyphus")
html("div",class="element",id="first",.content="Sisyphus")

div <- html("div",class="element",id="first",linebreak=c(TRUE,TRUE))
content(div) <- "Sisyphus"
div

tag <- html("tag",linebreak=TRUE)
attribs(tag)["class"] <- "something"
attribs(tag)["class"]
tag

style(tag) <- c(color="#342334")
style(tag)
tag

style(tag)["bg"] <- "white"
tag

setStyle(tag,bg="black")
setStyle(tag,c(bg="black"))

c(div,tag,tag)

c(
  c(div,tag),
  c(div,tag,tag)
)

c(
  c(div,tag),
  div,tag,tag
)

c(
  div,tag,
  c(div,tag,tag)
)

content(div) <- c(tag,tag,tag)
div


css("background-color"="black",
                  color="white")

as.css(c("background-color"="black",
                  color="white"))



Hello <- "Hello World!"
Hello <- html("p",Hello)
style(Hello) <- c(color="white",
                  "font-size"="40px",
                  "text-align"="center")

Link <- html("a","More examples here ...",
              href="http://elff.eu/software/memisc",
              title="More examples here ...",
              style=css(color="white"))
Link <- html("p"," (",Link,")")
style(Link) <- c(color="white",
                 "font-size"="15px",
                 "text-align"="center")
                  
Hello <- html("div",c(Hello,Link))
style(Hello) <- c("background-color"="#160666",
                  padding="20px")

show_html(Hello)




