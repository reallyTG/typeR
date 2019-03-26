## ---- include=FALSE, cache=FALSE-----------------------------------------
library(XiMpLe)

## ---- set-options, echo=FALSE, cache=FALSE-----------------------------------------
options(width=85)

## ----------------------------------------------------------------------------------
XMLNode("useless")

## ----------------------------------------------------------------------------------
XMLNode("other", attrs=list(foo="bar"))

## ----------------------------------------------------------------------------------
XMLNode("other", "", attrs=list(foo="bar"))

## ----------------------------------------------------------------------------------
XMLNode("other", attrs=list(foo="bar"), .children=list(""))

## ----------------------------------------------------------------------------------
XMLNode(
  "other",
  "this text is the child of the \"other\" node.",
  attrs=list(foo="bar")
)

## ----------------------------------------------------------------------------------
XMLNode("!--", "following is an empty node named \"useless\"")

## ----------------------------------------------------------------------------------
sample.XML.a <- XMLNode("a", "klick here!", attrs=list(href="http://example.com", target="_blank"))
sample.XML.body <- XMLNode("body", sample.XML.a)
sample.XML.html <- XMLNode("html", XMLNode("head", ""), sample.XML.body)
(sample.XML.tree <- XMLTree(sample.XML.html,
  xml=list(version="1.0", encoding="UTF-8"),
  dtd=list(doctype="html", decl="PUBLIC",
  id="-//W3C//DTD XHTML 1.0 Transitional//EN",
  refer="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd")))

## ----------------------------------------------------------------------------------
useless.node <- XMLNode("useless")
pasteXML(useless.node)

## ---- eval=FALSE-------------------------------------------------------------------
#  cat(pasteXML(sample.XML.tree), file="example.html")

## ---- eval=FALSE-------------------------------------------------------------------
#  sample.XML.parsed <- parseXMLTree("example.html")

## ----------------------------------------------------------------------------------
my.XML.stuff <- c("<start>here it begins","</start>")
parseXMLTree(my.XML.stuff, object=TRUE)

## ----------------------------------------------------------------------------------
node(sample.XML.tree, node=list("html","body","a"), what="attributes")

## ----------------------------------------------------------------------------------
node(sample.XML.tree, node=list("html","body","a"), what="value")

## ----------------------------------------------------------------------------------
node(sample.XML.tree, node=list("html","body","a"), what="attributes", element="href") <- "http://example.com/foobar"
node(sample.XML.tree, node=list("html","body","a"), what="attributes", element="target") <- NULL
sample.XML.tree

