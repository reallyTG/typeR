library(RZabbix)


### Name: ZabbixAPI
### Title: R module for working with the 'Zabbix API'
### Aliases: ZabbixAPI

### ** Examples

## Not run: 
##D # user authentication
##D #####################
##D ZabbixAPI('http://localhost/zabbix',
##D           body = list(method = "user.login",
##D                       params = jsonlite::unbox(
##D 	                      data.frame(user = "Admin",
##D 	                                 password = "zabbix")))) -> auth
##D 
##D # request to get histoy of an item of 'item_id' number
##D ######################################################
##D ZabbixAPI('http://localhost/zabbix',
##D           body = list(method = "history.get",
##D                       params = jsonlite::unbox(
##D                        data.frame(output = "extend",
##D                                   itemids = "item_id",
##D                                   history = 0,
##D                                   sortfield = "clock",
##D                                   sortorder = "DESC",
##D                                   limit = 10)
##D                      ),
##D                      auth = auth))
##D 
##D # API info
##D ##########
##D ZabbixAPI('http://localhost/zabbix',
##D           body = list(method = "apiinfo.version"))
##D 
##D # fromJSON example for get event data fo object with 'object_id' number
##D #######################################################################
##D library(jsonlite)
##D paste0('{
##D     "method": "event.get",
##D     "params": {
##D         "output": "extend",
##D         "select_acknowledges": "extend",
##D         "objectids": "object_id",
##D         "sortfield": ["clock", "eventid"],
##D         "sortorder": "DESC"
##D     },
##D     "auth": "', auth, '"
##D }') -> json_rpc
##D 
##D ZabbixAPI('http://localhost/zabbix',
##D           body = fromJSON(json_rpc)) -> event.info
##D # colnames - https://www.zabbix.com/documentation/3.0/manual/api/reference/event/object           
##D           
##D event.info  %>%
##D   select(value, clock) %>%
##D   mutate(clock = 
##D             as.POSIXct(as.numeric(clock),
##D                        tz = "GMT",
##D                        origin = "1970-01-01")) -> clock2viz
##D 
##D list2bind <- list()
##D for(i in 1:(nrow(clock2viz)-1)) {
##D   data.frame(
##D     times = 
##D       seq(from = clock2viz$clock[i+1],
##D         to = clock2viz$clock[i],
##D         by = "min") %>%
##D       head(-1),
##D     status = clock2viz$value[i+1],
##D     stringsAsFactors = FALSE) ->
##D   list2bind[[i]]
##D }
##D 
##D library(ggplot2)
##D do.call(bind_rows, list2bind) %>% 
##D   ggplot(aes(x=times, y = status)) + 
##D   geom_point(size = 0.1) 
## End(Not run)



