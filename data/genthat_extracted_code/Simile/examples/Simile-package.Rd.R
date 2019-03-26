library(Simile)


### Name: Simile-package
### Title: Interface to executable Simile models
### Aliases: Simile-package Simile
### Keywords: model

### ** Examples

require("Simile")
exec.extn <- as.character(tcl("info","sharedlibextension"))
if (interactive()) {
  path.to.installation <- tcl("tk_chooseDirectory", "-title",
  		       "Folder where Simile is installed:")

  path.to.spiro <- tcl("tk_getOpenFile",
		       "-title", "Compiled binary for Spiro example:",		
                       "-initialfile", paste("spiro",exec.extn,sep=""))
} else { 
  path.to.installation <- "dummy/path"
  path.to.spiro <- "dummy.dll"
}

use.simile.at(path.to.installation)
mHandle <- load.model(path.to.spiro)
objs <- list.objects(mHandle)

for (obj in objs) {
  print(c(obj, get.model.property(mHandle, obj, "Class")))
}

iHandle <- create.model(mHandle)
# model step is 0.1 by default but spiro only needs 1.0
set.model.step(iHandle, 1, 1)

# initialize the model, including default slider values
reset.model(iHandle, -2)

xs <- list(get.value.list(iHandle, "/runs/x"))
ys <- list(get.value.list(iHandle, "/runs/y"))
for (count in 1:1739) {
  execute.model(iHandle, count)
  xs[[count+1]] <- get.value.list(iHandle, "/runs/x")
  ys[[count+1]] <- get.value.list(iHandle, "/runs/y")
}
xs <- mapply(c,xs)
ys <- mapply(c,ys)
print("View default pattern -- now try to plot dancer")
plot(xs, ys, type="l")

# now we are going to parameterize it using a state file for the slider helper
# -- to make this work we load the mime library, which is needed only because
# the dancer.spf in Simile v5.97 is an older v4.x format file. No need to load 
# if testing, and will always be available if live because required for Simile.

if (!is.dummy(iHandle)) {
   tcl("package","require","mime")
}
pFile  <- tcl("file", "join", path.to.installation, "Examples", "dancer.spf")
consult.parameter.metafile(iHandle, pFile)

# also the file from the distribution has no value for "Wheel outside?"
# so we set this boolean directly
pHandle <- create.param.array(iHandle, "/start/Wheel outside?")
set.model.parameter(pHandle, FALSE)

# apply reset at level 0 to propagate input values
reset.model(iHandle, 0)

xs <- list(get.value.list(iHandle, "/runs/x"))
ys <- list(get.value.list(iHandle, "/runs/y"))
for (count in 1:419) {
  execute.model(iHandle, count)
  xs[[count+1]] <- get.value.list(iHandle, "/runs/x")
  ys[[count+1]] <- get.value.list(iHandle, "/runs/y")
}
xs <- mapply(c,xs)
ys <- mapply(c,ys)
plot(xs, ys, type="l")

print("OK, but that's not how it looks on Simile is it? Try this...")
xs <- aperm(xs, c(2,1))
ys <- aperm(ys, c(2,1))
plot(xs, ys, type="l")



