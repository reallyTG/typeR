library(XiMpLe)


### Name: XMLName
### Title: Getter/setter methods for S4 objects of XiMpLe XML classes
### Aliases: XMLName XMLName,XiMpLe.node-method XMLName,-methods XMLName<-
###   XMLName<-,XiMpLe.node-method XMLName<-,-methods XMLAttrs
###   XMLAttrs,XiMpLe.node-method XMLAttrs,-methods XMLAttrs<-
###   XMLAttrs<-,XiMpLe.node-method XMLAttrs<-,-methods XMLChildren
###   XMLChildren,XiMpLe.node-method XMLChildren,-methods
###   XMLChildren,XiMpLe.doc-method XMLChildren,-methods XMLChildren<-
###   XMLChildren<-,XiMpLe.node-method XMLChildren<-,-methods
###   XMLChildren<-,XiMpLe.doc-method XMLChildren<-,-methods XMLValue
###   XMLValue,XiMpLe.node-method XMLValue,-methods XMLValue<-
###   XMLValue<-,XiMpLe.node-method XMLValue<-,-methods XMLFile
###   XMLFile,XiMpLe.doc-method XMLFile,-methods XMLFile<-
###   XMLFile<-,XiMpLe.doc-method XMLFile<-,-methods XMLDecl
###   XMLDecl,XiMpLe.doc-method XMLDecl,-methods XMLDecl<-
###   XMLDecl<-,XiMpLe.doc-method XMLDecl<-,-methods XMLDTD
###   XMLDTD,XiMpLe.doc-method XMLDTD,-methods XMLDTD<-
###   XMLDTD<-,XiMpLe.doc-method XMLDTD<-,-methods XMLScan
###   XMLScan,XiMpLe.node-method XMLScan,-methods XMLScan,XiMpLe.doc-method
###   XMLScan<- XMLScan<-,XiMpLe.node-method XMLScan<-,-methods
###   XMLScan<-,XiMpLe.doc-method XMLScanDeep
###   XMLScanDeep,XiMpLe.node-method XMLScanDeep,-methods
###   XMLScanDeep,XiMpLe.doc-method
### Keywords: methods

### ** Examples

xmlTestNode <- XMLNode("foo", XMLNode("testchild"))
XMLName(xmlTestNode) # returns "foo"
XMLName(xmlTestNode) <- "bar"
XMLName(xmlTestNode) # now returns "bar"

# search for a child node
XMLScan(xmlTestNode, "testchild")
# remove nodes of that name
XMLScan(xmlTestNode, "testchild") <- NULL



