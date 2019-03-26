library(JGR)


### Name: jgr.addSubMenu
### Title: New JGR Console sub-menu
### Aliases: jgr.addSubMenu jgr.insertSubMenu
### Keywords: programming

### ** Examples

jgr.addMenu("added menu")
jgr.addMenuItem("added menu", "print 1","print(1)")
jgr.insertMenuItem("added menu","print 1 as if entered in console","print(1)",1,FALSE)
jgr.addMenuSeparator("added menu")
jgr.addSubMenu("added menu","sub menu",c("a","b","c"),c("print('a')","print('b')","print('c')"))




