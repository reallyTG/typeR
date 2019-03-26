library("tuneR")
d <- list.files("Testfiles", pattern="\\.mid$")
garbage <- lapply(d, 
    function(x) {
        mid <- readMidi(file.path("Testfiles", x))
        cat(x, "\n")
        print(mid)
        print(getMidiNotes(mid))
    }
)
