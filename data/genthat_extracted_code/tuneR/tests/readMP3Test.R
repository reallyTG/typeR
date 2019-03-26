library("tuneR")
d <- list.files("Testfiles", pattern="\\.mp3$")
garbage <- lapply(d, 
    function(x) {
        wav <- readMP3(file.path("Testfiles", x))
        cat(x, "\n")
        print(wav)
        if(is(wav, "Wave")){
            print(rev(wav@left)[1:10])
            if(wav@stereo)
                print(rev(wav@right)[1:10])
        } else {
            print(wav@.Data[1:10,])
        }
    }
)
