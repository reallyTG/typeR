library(JGR)


### Name: jgr.addMenu
### Title: New JGR Console Menu
### Aliases: jgr.addMenu jgr.insertMenu
### Keywords: programming

### ** Examples

jgr.addMenu("Workspace")
jgr.addMenuItem("Workspace","Browse","ls()")
jgr.addMenuSeparator("Workspace")
jgr.addMenuItem("Workspace","Browse (pos=2)","ls(pos=2)")


menus <- jgr.getMenuNames()
index <- which(menus=="Packages & Data")
if(length(index)==0) index <- 1

jgr.insertMenu("User menu", index)
jgr.addMenuItem("User menu", "Good place for user generated menus is",
                "print('before Packages & Data')")



