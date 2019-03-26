library(JGR)


### Name: jgr.getMenuNames
### Title: JGR Console menus
### Aliases: jgr.getMenuItemNames jgr.getMenuNames
### Keywords: programming

### ** Examples

menus <- jgr.getMenuNames()
index <- which(menus=="Packages & Data")
if(length(index)==0) index <- 1

jgr.insertMenu("User menu",index)
jgr.addMenuItem("User menu", "Good place for user generated menus is",
                "print('before Packages & Data')")



