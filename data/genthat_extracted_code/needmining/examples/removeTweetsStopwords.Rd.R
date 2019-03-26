library(needmining)


### Name: removeTweetsStopwords
### Title: Remove Tweets containing stopwords
### Aliases: removeTweetsStopwords

### ** Examples

stopWords <- "review;giveaway;save;deal;win;won;price;launch;news;gift;announce;
 			 reveal;sale;http;buy;bought;purchase;sell;sold;invest;discount;
			coupon;ship;giving away"
data(NMTrainingData)
filteredTweets <- removeTweetsStopwords(NMTrainingData, stopWords)



