library(TexExamRandomizer)


### Name: CompileLatexDir
### Title: Compiling function
### Aliases: CompileLatexDir CompileLatexDirEXAM CompileLatexDirHW
### Keywords: internal

### ** Examples


input_folder <- system.file(
    "extdata",
    "ExampleTexDocuments",
    package = "TexExamRandomizer")


TexExamRandomizer::CompileLatexDir(
    pdf.dir.out = tempdir(),
    engine= "pdf",
    latex.dir.in = input_folder,
    extracmdoptions = "-time")




