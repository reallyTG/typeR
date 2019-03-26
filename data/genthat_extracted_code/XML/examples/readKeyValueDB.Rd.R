library(XML)


### Name: readKeyValueDB
### Title: Read an XML property-list style document
### Aliases: readKeyValueDB readKeyValueDB,character-method
###   readKeyValueDB,XMLInternalDocument-method
###   readKeyValueDB,XMLInternalNode-method readKeyValueDB,AsIs-method
### Keywords: IO

### ** Examples

 if(file.exists("/usr/share/hiutil/Stopwords.plist")) {
  o = readKeyValueDB("/usr/share/hiutil/Stopwords.plist")
 }

 if(file.exists("/usr/share/java/Tools/Applet Launcher.app/Contents/Info.plist"))
    javaInfo = readKeyValueDB('/usr/share/java/Tools/Applet Launcher.app/Contents/Info.plist')



