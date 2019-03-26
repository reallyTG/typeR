library(berryFunctions)


### Name: googleLink2pdf
### Title: extract pdf link from google search result
### Aliases: googleLink2pdf
### Keywords: character

### ** Examples


Link <- paste0("http://www.google.de/url?sa=t&rct=j&q=&esrc=s&source=web&cd=1",
        "&cad=rja&sqi=2&ved=0CDIQFjAA&url=http%3A%2F%2Fcran.r-project.org",
        "%2Fdoc%2Fmanuals%2FR-intro.pdf&ei=Nyl4UfHeOIXCswa6pIC4CA",
        "&usg=AFQjCNGejDwPlor4togQZmQEQv72cK9z8A&bvm=bv.45580626,d.Yms")
googleLink2pdf(Link)

Link <- paste0("https://www.google.de/url?sa=t&rct=j&q=&esrc=s&source=web&cd=1",
        "&cad=rja&uact=8&ved=0ahUKEwjLlfmClavRAhWaN1AKHcGSBjEQFgghMAA",
        "&url=http%3A%2F%2Fstackoverflow.com%2Fquestions%2Ftagged%2Fr",
        "&usg=AFQjCNHYj6HjSs6Lvczn9wMWxE3slCdq1Q&bvm=bv.142059868,d.ZWM")
googleLink2pdf(Link)
Link <- paste0("https://www.google.de/url?sa=t&rct=j&q=&esrc=s&source=web&cd=2",
        "&cad=rja&uact=8&ved=0ahUKEwjLlfmClavRAhWaN1AKHcGSBjEQFggpMAE&",
        "url=http%3A%2F%2Fstackoverflow.com%2Fquestions%2Ftagged%2F%3Ftagnames",
        "%3Dr%26sort%3Dactive&usg=AFQjCNGkPGHq05qwKLLW4vRXdmk2Olhmig&bvm=bv.142059868,d.ZWM")
googleLink2pdf(Link)




