library(selectr)


### Name: querySelectorAll
### Title: Find nodes that match a group of CSS selectors in an XML tree.
### Aliases: querySelector querySelectorAll querySelectorNS
###   querySelectorAllNS

### ** Examples

  hasXML <- require(XML)
  hasxml2 <- require(xml2)

  if (!hasXML && !hasxml2)
    return() # can't demo without XML or xml2 packages present

  parseFn <- if (hasXML) xmlParse else read_xml
  # Demo for working with the XML package (if present, otherwise xml2)
  exdoc <- parseFn('<a><b class="aclass"/><c id="anid"/></a>')
  querySelector(exdoc, "#anid")   # Returns the matching node
  querySelector(exdoc, ".aclass") # Returns the matching node
  querySelector(exdoc, "b, c")    # First match from grouped selection
  querySelectorAll(exdoc, "b, c") # Grouped selection
  querySelectorAll(exdoc, "b")    # A list of length one
  querySelector(exdoc, "d")       # No match
  querySelectorAll(exdoc, "d")    # No match

  # Read in a document where two namespaces are being set:
  # SVG and MathML
  svgdoc <- parseFn(system.file("demos/svg-mathml.svg",
                                package = "selectr"))
  # Search for <script/> elements in the SVG namespace
  querySelectorNS(svgdoc, "svg|script",
                  c(svg = "http://www.w3.org/2000/svg"))
  querySelectorAllNS(svgdoc, "svg|script",
                     c(svg = "http://www.w3.org/2000/svg"))
  # MathML content is *within* SVG content,
  # search for <mtext> elements within the MathML namespace
  querySelectorNS(svgdoc, "math|mtext",
                  c(math = "http://www.w3.org/1998/Math/MathML"))
  querySelectorAllNS(svgdoc, "math|mtext",
                     c(math = "http://www.w3.org/1998/Math/MathML"))
  # Search for *both* SVG and MathML content
  querySelectorAllNS(svgdoc, "svg|script, math|mo",
                     c(svg = "http://www.w3.org/2000/svg",
                       math = "http://www.w3.org/1998/Math/MathML"))

  if (!hasXML)
    return() # already demo'd xml2

  # Demo for working with the xml2 package
  exdoc <- read_xml('<a><b class="aclass"/><c id="anid"/></a>')
  querySelector(exdoc, "#anid")   # Returns the matching node
  querySelector(exdoc, ".aclass") # Returns the matching node
  querySelector(exdoc, "b, c")    # First match from grouped selection
  querySelectorAll(exdoc, "b, c") # Grouped selection
  querySelectorAll(exdoc, "b")    # A list of length one
  querySelector(exdoc, "d")       # No match
  querySelectorAll(exdoc, "d")    # No match

  # Read in a document where two namespaces are being set:
  # SVG and MathML
  svgdoc <- read_xml(system.file("demos/svg-mathml.svg",
                                 package = "selectr"))
  # Search for <script/> elements in the SVG namespace
  querySelectorNS(svgdoc, "svg|script",
                  c(svg = "http://www.w3.org/2000/svg"))
  querySelectorAllNS(svgdoc, "svg|script",
                     c(svg = "http://www.w3.org/2000/svg"))
  # MathML content is *within* SVG content,
  # search for <mtext> elements within the MathML namespace
  querySelectorNS(svgdoc, "math|mtext",
                  c(math = "http://www.w3.org/1998/Math/MathML"))
  querySelectorAllNS(svgdoc, "math|mtext",
                     c(math = "http://www.w3.org/1998/Math/MathML"))
  # Search for *both* SVG and MathML content
  querySelectorAllNS(svgdoc, "svg|script, math|mo",
                     c(svg = "http://www.w3.org/2000/svg",
                       math = "http://www.w3.org/1998/Math/MathML"))



